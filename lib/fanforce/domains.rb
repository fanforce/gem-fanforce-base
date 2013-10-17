require_relative 'domain_environments'

module Fanforce::Domains
  extend Fanforce::Utils
  def self.included(base) base.extend(self)  end

  def base_domain
    Fanforce::DomainEnvironments.method(ENV['RACK_ENV'] || 'development').call[:base]
  end

  def default_short_domain
    Fanforce::DomainEnvironments.method(ENV['RACK_ENV'] || 'development').call[:default_short_domain]
  end

  def apps_base_domain
    Fanforce::DomainEnvironments.method(ENV['RACK_ENV'] || 'development').call[:apps_base]
  end

  def plugins_base_domain
    Fanforce::DomainEnvironments.method(ENV['RACK_ENV'] || 'development').call[:plugins_base]
  end

  def widgets_base_domain
    Fanforce::DomainEnvironments.method(ENV['RACK_ENV'] || 'development').call[:widgets_base]
  end

  def api_domain
    'api.' + base_domain
  end

  def eye_domain
    'i.' + base_domain
  end

  def assets_domain
    'assets.' + base_domain
  end

  def controller_domain
    'controller.' + base_domain
  end

  def addon_management_url
    controller_domain + '/db'
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