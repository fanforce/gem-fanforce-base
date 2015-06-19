module Fanforce::Base::DomainEnvironments

  # Base domains for development environment.
  # @return [hash]
  def self.development
    root_domain = (ENV['FANFORCE_GEM_TOP_LEVEL_DOMAIN'] || 'dev')
    {
        :base                 => ENV['FANFORCE_GEM_BASE_DOMAIN']            || "fanforce.#{root_domain}",
        :default_short_domain => ENV['FANFORCE_GEM_DEFAULT_SHORT_DOMAIN']   || "fnfrc.#{root_domain}",
        :plugins_base         => ENV['FANFORCE_GEM_PLUGINS_BASE_DOMAIN']    || "ffplugin.#{root_domain}",
        :plugins_base_mx      => ENV['FANFORCE_GEM_PLUGINS_BASE_MX_DOMAIN'] || "ffplugin.me",
    }
  end

  # Base domains for test environment.
  # @return [hash]
  def self.test
    {
      :base                 => 'fanforce.dev',
      :default_short_domain => 'fnfrc.dev',
      :plugins_base         => 'ffplugin.dev',
      :plugins_base_mx      => 'ffplugin.me',
    }
  end

  # Base domains for staging environment.
  # @return [hash]
  def self.staging
    {
        :base                 => 'fanforce-staging.com',
        :default_short_domain => 'fnfrc.us',
        :plugins_base         => 'ffplugin.us',
        :plugins_base_mx      => 'ffplugin.us',
    }
  end

  # Base domains for production environment.
  # @return [hash]
  def self.production
    {
        :base                 => 'fanforce.com',
        :default_short_domain => 'fanforce.io',
        :plugins_base         => 'ffplugin.io',
        :plugins_base_mx      => 'ffplugin.io',
    }
  end

end
