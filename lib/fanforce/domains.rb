module Fanforce::Domains

  def self.development
    base_domain = (ENV['FANFORCE_GEM_TOP_LEVEL_DOMAIN'] || 'gg')
    {
        :base                 => ENV['FANFORCE_GEM_BASE_DOMAIN'] || "fanforce.#{base_domain}",
        :default_short_domain => ENV['FANFORCE_GEM_DEFAULT_SHORT_DOMAIN'] || "fanforc.#{base_domain}",
        :apps_base            => ENV['FANFORCE_GEM_APPS_BASE_DOMAIN']     || "ffapp.#{base_domain}",
        :plugins_base         => ENV['FANFORCE_GEM_PLUGINS_BASE_DOMAIN']  || "ffplugin.#{base_domain}",
        :widgets_base         => ENV['FANFORCE_GEM_WIDGETS_BASE_DOMAIN']  || "ffwidget.#{base_domain}"
    }
  end

  def self.test
    {
      :base                 => 'fanforce.gg',
      :default_short_domain => 'fanforc.gg',
      :apps_base            => 'ffapp.gg',
      :plugins_base         => 'ffplugin.gg',
      :widgets_base         => 'ffwidget.gg'
    }
  end

  def self.staging
    {
        :base                 => 'fanforce-staging.com',
        :default_short_domain => 'fanforc.us',
        :apps_base            => 'ffapp.us',
        :plugins_base         => 'ffplugin.us',
        :widgets_base         => 'ffwidget.us'
    }
  end

  def self.production
    {
        :base                 => 'fanforce.com',
        :default_short_domain => 'fanforce.io',
        :apps_base            => 'ffapp.io',
        :plugins_base         => 'ffplugin.io',
        :widgets_base         => 'ffwidget.io'
    }
  end

end
