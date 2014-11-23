module Fanforce::DomainEnvironments

  def self.development
    root_domain = (ENV['FANFORCE_GEM_TOP_LEVEL_DOMAIN'] || 'gg')
    {
        :base                 => ENV['FANFORCE_GEM_BASE_DOMAIN'] || "fanforce.#{root_domain}",
        :default_short_domain => ENV['FANFORCE_GEM_DEFAULT_SHORT_DOMAIN'] || "fanforc.#{root_domain}",
        :apps_base            => ENV['FANFORCE_GEM_APPS_BASE_DOMAIN']     || "ffapp.#{root_domain}",
    }
  end

  def self.test
    {
      :base                 => 'fanforce.gg',
      :default_short_domain => 'fanforc.gg',
      :apps_base            => 'ffapp.gg',
    }
  end

  def self.staging
    {
        :base                 => 'fanforce-staging.com',
        :default_short_domain => 'fanforc.us',
        :apps_base            => 'ffapp.us',
    }
  end

  def self.production
    {
        :base                 => 'fanforce.com',
        :default_short_domain => 'fanforce.io',
        :apps_base            => 'ffapp.io',
    }
  end

end
