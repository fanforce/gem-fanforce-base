require_relative 'domain_environments'

module Fanforce::Base::Domains
  extend self
  def self.included(base) base.extend(self) end

  # Current rack environment (i.e., production)
  # @return [string] defaults to development
  def environment
    ENV['RACK_ENV'] || 'development'
  end

  # Abbreviation of current rack environment (i.e., dev)
  # @return [symbol]
  def environ
    case environment
      when 'production'  then :prd
      when 'staging'     then :stg
      when 'test'        then :tst
      when 'development' then :dev
    end
  end


  # Base domain (i.e., fanforce.com) for current environment
  # @return [domain]
  def base_domain
    Fanforce::Base::DomainEnvironments.method(environment).call[:base]
  end

  # Default short domain (i.e., fanforce.io) for current environment
  # @return [domain]
  def default_short_domain
    Fanforce::Base::DomainEnvironments.method(environment).call[:default_short_domain]
  end

  # Base domain used for plugins (i.e., ffplugin.com) for current environment
  # @return [domain]
  def plugins_base_domain
    Fanforce::Base::DomainEnvironments.method(environment).call[:plugins_base]
  end

  # Base email domain used for plugins (i.e., ffplugin.com) for current environment
  # @return [domain]
  def plugins_base_mx_domain
    Fanforce::Base::DomainEnvironments.method(environment).call[:plugins_base_mx]
  end

  # Domain for accessing supercore-api (i.e., api.fanforce.com) for current environment
  # @return [domain]
  def api_domain
    'api.' + base_domain
  end

  # Domain for accessing supercore-api with https (through heroku) for current environment
  # @return [domain]
  def api_domain_ssl
    environment == 'development' ? api_domain : "#{environ.to_s}-supercore-api.herokuapp.com"
  end

  # Domain for accessing supercore-eye (i.e., i.fanforce.com) for current environment
  # @return [domain]
  def eye_domain
    'i.' + base_domain
  end

  # Domain for accessing supercore-controller (i.e., controller.fanforce.com) for current environment
  # @return [domain]
  def controller_domain
    'controller.' + base_domain
  end

  # Domain for accessing uranium (i.e., uranium.fanforce.com) for current environment
  # @return [domain]
  def uranium_domain
    'uranium.' + base_domain
  end

  # Domain for Fanforce's website (i.e., fanforce.com) for current environment
  # @return [domain]
  def website_domain
    'www.' + base_domain
  end

  # Domain for accessing the Developer Panel (i.e., developer.fanforce.com) for current environment
  # @return [domain]
  def developer_domain
    'developer.' + base_domain
  end

  ###########
  # The following should be moved to edition config
  ###########

  # Domain for accessing the Client Panel for current environment
  # @return [domain]
  def client_domain
    'app.' + base_domain
  end

  # Domain for accessing the Signup Panel for current environment
  # @return [domain]
  def signup_domain
    'signup.' + base_domain
  end

end
