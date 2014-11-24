module Fanforce::Base::InternalUtils

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