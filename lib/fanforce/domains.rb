require_relative 'domain_environments'

module Fanforce::Domains
  extend Fanforce::Domains
  def self.included(base) base.extend(self) end

  def environment
    ENV['RACK_ENV'] || 'development'
  end

  def environ
    case environment
      when 'production'  then :Prd
      when 'staging'     then :Stg
      when 'test'        then :Test
      when 'development' then :Dev
    end
  end

  def base_domain
    Fanforce::DomainEnvironments.method(environment).call[:base]
  end

  def default_short_domain
    Fanforce::DomainEnvironments.method(environment).call[:default_short_domain]
  end

  def apps_base_domain
    Fanforce::DomainEnvironments.method(environment).call[:apps_base]
  end

  def components_base_domain
    Fanforce::DomainEnvironments.method(environment).call[:components_base]
  end

  def api_domain
    'api.' + base_domain
  end

  def api_domain_ssl
    environment == 'development' ? api_domain : "#{environ.to_s.downcase}-supercore-api.herokuapp.com"
  end

  def eye_domain
    'i.' + base_domain
  end

  def assets_domain
    'assets.' + base_domain
  end

  def assets_domain_ssl
    environment == 'development' ? assets_domain : "#{environ.to_s.downcase}-supercore-assets.herokuapp.com"
  end

  def controller_domain
    'controller.' + base_domain
  end

  def uranium_domain
    'uranium.' + base_domain
  end

  def website_domain
    'www.' + base_domain
  end

  def developers_domain
    'developers.' + base_domain
  end

  # these should be moved to edition

  def app_domain
    'app.' + base_domain
  end

  def signup_domain
    'signup.' + base_domain
  end

  def marketplace_domain
    'marketplace.' + base_domain
  end

end