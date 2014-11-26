module Fanforce::Base::DomainEnvironments

  # Base domains for development environment.
  # @return [hash]
  def self.development
    root_domain = (ENV['FANFORCE_GEM_TOP_LEVEL_DOMAIN'] || 'dev')
    {
        :base                 => ENV['FANFORCE_GEM_BASE_DOMAIN'] || "fanforce.#{root_domain}",
        :default_short_domain => ENV['FANFORCE_GEM_DEFAULT_SHORT_DOMAIN'] || "fnfrc.#{root_domain}",
        :apps_base            => ENV['FANFORCE_GEM_APPS_BASE_DOMAIN']     || "ffapp.#{root_domain}",
    }
  end

  # Base domains for test environment.
  # @return [hash]
  def self.test
    {
      :base                 => 'fanforce.dev',
      :default_short_domain => 'fnfrc.dev',
      :apps_base            => 'ffapp.dev',
    }
  end

  # Base domains for staging environment.
  # @return [hash]
  def self.staging
    {
        :base                 => 'fanforce-staging.com',
        :default_short_domain => 'fnfrc.us',
        :apps_base            => 'ffapp.us',
    }
  end

  # Base domains for production environment.
  # @return [hash]
  def self.production
    {
        :base                 => 'fanforce.com',
        :default_short_domain => 'fanforce.io',
        :apps_base            => 'ffapp.io',
    }
  end

end
