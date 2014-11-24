require 'uri'
require 'cgi'
require 'rack/utils'
require 'addressable/uri'

require_relative 'internal_utils'

module Fanforce::Base::Utils
  extend self
  def self.included(base) base.extend(self)  end

  # An object is blank if it's nil, false, or empty. For example, '', nil, [], and {} are all blank.
  # @return [boolean]
  def is_blank?(obj)
    obj.respond_to?(:empty?) ? !!obj.empty? : !obj
  end

  # An object is present if it's not blank.
  # @return [boolean]
  def is_present?(obj)
    !is_blank?(obj)
  end

  # Return a new hash with all keys converted to symbols, as long as they respond to to_sym.
  def symbolize_keys(object) #:nodoc:
    Fanforce::Base::InternalUtils.modify_keys(object) do |key|
      key.is_a?(String) ? key.to_sym : key
    end
  end

  # Convert a URL string to a hash of URI parts:
  # - scheme
  # - host
  # - port
  # - path
  # - query_params
  # - query_string
  # - fragment
  # - clean_url
  # @param url [string]
  # @return [hash]
  def extract_uri_hash(url)
    uri = extract_uri(url) || return
    if is_present?(uri.query)
      query_params = Rack::Utils.parse_nested_query(uri.query).inject({}) do |result, (k,v)|
        result[k] = v if k !~ /^ff_.+/
        result
      end
      query_string = to_query_string(Hash[query_params.sort])
    end
    fragment = uri.fragment.gsub(/^ff_[^=]+=[^&]+$/, '').gsub(/&ff_[^=]+=[^&]+/, '') if is_present?(uri.fragment)

    uri_hash = {}
    uri_hash[:scheme] = uri.scheme || 'http'
    uri_hash[:host]   = clean_uri_var(uri.host)
    uri_hash[:port]   = clean_uri_var(uri.port)
    uri_hash[:path]   = clean_uri_var(uri.path || '/')
    uri_hash[:query_params] = query_params || {}
    uri_hash[:query_string] = query_string || ''
    uri_hash[:fragment]  = fragment || ''
    uri_hash[:clean_url] = "#{uri_hash[:scheme]}://#{uri_hash[:host]}#{":#{uri_hash[:port]}" if [80,443].include?(uri_hash[:port])}#{uri_hash[:path]}#{"?#{query_string}" if is_present?(uri_hash[:query_string])}"
    return uri_hash
  end

  def clean_uri_var(v)
    (v.is_a?(Hash) or v.is_a?(Array) or v.is_a?(Integer)) ? v : v.to_s
  end

  def extract_uri(url)
    url = url.gsub(/^file:\/\/:/, 'file://LOCALFILE') if url =~ /^file:\/\//
    Addressable::URI.parse(url)
  rescue
    return if !url.is_a?(String)
    if url =~ /^(http(.+))http\2+$/
      extract_uri($1)
    elsif url =~ /^(.+)#.*\s+.+$/
      extract_uri($1)
    end
  end

  def to_query_string(obj, namespace=nil)
    return '' if is_blank?(obj)
    if obj.is_a?(Array)
      obj.collect { |value| to_query_string(value, "#{namespace}[]") }.join '&'
    elsif obj.is_a?(Hash)
      obj.collect { |key, value| to_query_string(value, namespace ? "#{namespace}[#{key}]" : key) }.sort * '&'
    elsif obj.is_a?(Object)
      "#{CGI.escape(Fanforce::Base::InternalUtils.to_param(namespace))}=#{CGI.escape(Fanforce::Base::InternalUtils.to_param(obj).to_s)}"
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

end
