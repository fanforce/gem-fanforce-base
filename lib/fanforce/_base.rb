class Fanforce
  require_relative 'domains'

  def self.base_domain
    Fanforce::Domains.method(ENV['RACK_ENV'] || 'development').call[:base]
  end

  def self.default_smarturl_domain
    Fanforce::Domains.method(ENV['RACK_ENV'] || 'development').call[:default_smarturl]
  end

  def self.apps_base_domain
    Fanforce::Domains.method(ENV['RACK_ENV'] || 'development').call[:apps_base]
  end

  def self.plugins_base_domain
    Fanforce::Domains.method(ENV['RACK_ENV'] || 'development').call[:plugins_base]
  end

  def self.widgets_base_domain
    Fanforce::Domains.method(ENV['RACK_ENV'] || 'development').call[:widgets_base]
  end

  def self.api_domain
    'api.' + base_domain
  end

  def self.i_domain
    'i.' + base_domain
  end

  def self.website_domain
    'www.' + base_domain
  end

  def self.developers_domain
    'developers.' + base_domain
  end

  def self.controller_domain
    'controller.' + base_domain
  end

  def self.addon_management_url
    controller_domain + '/db'
  end

  # these should be moved to edition

  def self.app_domain
    'app.' + base_domain
  end

  def self.signup_domain
    'signup.' + base_domain
  end

  def self.marketplace_domain
    'marketplace.' + base_domain
  end

end