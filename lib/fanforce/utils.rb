require 'uri'
require 'rack/utils'
require 'multi_json'

module Fanforce::Utils
  extend Fanforce::Utils
  def self.included(base) base.extend(self)  end

  def is_blank?(obj)
    obj.respond_to?(:empty?) ? obj.empty? : !obj
  end

  def is_present?(obj)
    !is_blank?(obj)
  end

  def symbolize_keys(object) #:nodoc:
    Fanforce::InternalUtils.modify_keys(object) do |key|
      key.is_a?(String) ? key.to_sym : key
    end
  end

  def parse_url(raw_url)
    return if is_blank?(raw_url)
    url = URI::parse(raw_url)
    query_params = Rack::Utils.parse_nested_query(url.query).inject({}) do |result, (k,v)|
      if k !~ /^ff_.+/
        result[k] = v
      end
      result
    end
    query_string = to_query_string(Hash[query_params.sort]) if is_present?(query_params)
    _external_id = url.host + url.path
    clean_url = "#{url.scheme}://#{url.host}#{(if ![80,443].include?(url.port) then ":#{url.port}" end)}#{url.path}#{(if is_present?(query_string) then "?#{query_string}" end)}"

    { _external_id: _external_id, clean_url: clean_url, raw_url: raw_url, query_params: query_params, query_string: query_string, scheme: url.scheme, host: url.host, port: url.port, path: url.path, fragment: url.fragment }
  end

  def to_query_string(obj, namespace=nil)
    return '' if is_blank?(obj)
    if obj.is_a?(Array)
      obj.collect { |value| to_query_string(value, "#{namespace}[]") }.join '&'
    elsif obj.is_a?(Hash)
      obj.collect { |key, value| to_query_string(value, namespace ? "#{namespace}[#{key}]" : key) }.sort * '&'
    elsif obj.is_a?(Object)
      require 'cgi' unless defined?(CGI) && defined?(CGI::escape)
      "#{CGI.escape(Fanforce::InternalUtils.to_param(namespace))}=#{CGI.escape(Fanforce::InternalUtils.to_param(obj).to_s)}"
    else
      raise "Argument must be an object, hash, or array; instead it was a #{obj.class}"
    end
  end

  def curl_command(method, url, req_params)
    case method.to_s.downcase.to_sym
      when :get
        "curl \"#{url}?#{to_query_string(req_params)}\""
      when :post
        "curl -X POST -d \"#{to_query_string(req_params)}\" #{url}"
      when :put
        "curl -X PUT -d \"#{to_query_string(req_params)}\" #{url.to_json}"
      when :delete
        "curl --request DELETE \"#{url}?#{to_query_string(req_params)}\""
      when :options
        "curl -X OPTIONS \"#{url}?#{to_query_string(req_params)}\""
      else
        raise 'Unknown request method'
    end
  end

  def decode_json(str, symbolize_keys=true)
    MultiJson.load(str, :symbolize_keys => symbolize_keys)
  end

end

module Fanforce::InternalUtils

  def self.modify_keys(object, &modifier) #:nodoc:
    case object
      when Array
        object.map do |value|
          modify_keys(value, &modifier)
        end
      when Hash
        object.inject({}) do |result, (key, value)|
          new_key   = modifier.call(key)
          new_value = modify_keys(value, &modifier)
          result.merge! new_key => new_value
        end
      else
        object
    end
  end

  def self.to_param(obj, namespace=nil)
    if obj.is_a?(Array)
      collect { |e| to_param(e) }.join '/'
    elsif obj.is_a?(Hash)
      to_query_string(obj, namespace)
    elsif obj.is_a?(NilClass)
      obj
    elsif obj.is_a?(TrueClass)
      obj
    elsif obj.is_a?(FalseClass)
      obj
    elsif obj.is_a?(Object)
      obj.to_s
    end
  end

end