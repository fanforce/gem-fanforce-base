module Fanforce::Domains

  def self.development
    puts "top-level-domain: #{ENV['FANFORCE_GEM_TOP_LEVEL_DOMAIN']}"
    {
        :base             => 'fanforce.gg',
        :default_smarturl => ENV['FANFORCE_GEM_BASE_DOMAIN'] || 'fanforce.' + (ENV['FANFORCE_GEM_TOP_LEVEL_DOMAIN'] || 'gg'),
        :apps_base        => 'ffapp.gg',
        :plugins_base     => 'ffplugin.gg',
        :widgets_base     => 'ffwidget.gg'
    }
  end

  def self.test
    {
      :base             => 'fanforce.gg',
      :default_smarturl => 'fanforc.gg',
      :apps_base        => 'ffapp.gg',
      :plugins_base     => 'ffplugin.gg',
      :widgets_base     => 'ffwidget.gg'
    }
  end

  def self.staging
    {
        :base             => 'fanforce-staging.com',
        :default_smarturl => 'fanforc.us',
        :apps_base        => 'ffapp.us',
        :plugins_base     => 'ffplugin.us',
        :widgets_base     => 'ffwidget.us'
    }
  end

  def self.production
    {
        :base             => 'fanforce.com',
        :default_smarturl => 'fanforce.io',
        :apps_base        => 'ffapp.io',
        :plugins_base     => 'ffplugin.io',
        :widgets_base     => 'ffwidget.io'
    }
  end

end
