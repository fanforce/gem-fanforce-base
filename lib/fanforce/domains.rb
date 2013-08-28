class Fanforce

  if ENV['RACK_ENV'] == 'production'
    BASE_DOMAIN             = 'fanforce.com'
    DEFAULT_SMARTURL_DOMAIN = 'fanforce.io'
    APPS_BASE_DOMAIN        = 'ffapp.io'
    PLUGINS_BASE_DOMAIN     = 'ffplugin.io'
    WIDGETS_BASE_DOMAIN     = 'ffwidget.io'

  elsif ENV['RACK_ENV'] == 'test'
    BASE_DOMAIN             = 'fanforce.gg'
    DEFAULT_SMARTURL_DOMAIN = 'fanforc.gg'
    APPS_BASE_DOMAIN        = 'ffapp.gg'
    PLUGINS_BASE_DOMAIN     = 'ffplugin.gg'
    WIDGETS_BASE_DOMAIN     = 'ffwidget.gg'

  elsif ENV['RACK_ENV'] == 'staging'
    BASE_DOMAIN             = 'fanforce-staging.com'
    DEFAULT_SMARTURL_DOMAIN = 'fanforc.us'
    APPS_BASE_DOMAIN        = 'ffapp.us'
    PLUGINS_BASE_DOMAIN     = 'ffplugin.us'
    WIDGETS_BASE_DOMAIN     = 'ffwidget.us'

  else
    TOP_LEVEL_DOMAIN        = ENV['FANFORCE_GEM_TOP_LEVEL_DOMAIN'] || 'gg'
    BASE_DOMAIN             = ENV['FANFORCE_GEM_BASE_DOMAIN'] || 'fanforce.' + TOP_LEVEL_DOMAIN
    DEFAULT_SMARTURL_DOMAIN = 'fanforc.gg'
    APPS_BASE_DOMAIN        = 'ffapp.gg'
    PLUGINS_BASE_DOMAIN     = 'ffplugin.gg'
    WIDGETS_BASE_DOMAIN     = 'ffwidget.gg'

  end

  API_DOMAIN           = 'api.' + BASE_DOMAIN
  I_DOMAIN             = 'i.' + BASE_DOMAIN
  WEBSITE_DOMAIN       = BASE_DOMAIN
  DEVELOPERS_DOMAIN    = 'developers.' + BASE_DOMAIN
  CONTROLLER_DOMAIN    = 'controller.' + BASE_DOMAIN
  ADDON_MANAGEMENT_URL = CONTROLLER_DOMAIN + '/db'

  # these should be moved to edition
  APP_DOMAIN           = 'app.' + BASE_DOMAIN
  SIGNUP_DOMAIN        = 'signup.' + BASE_DOMAIN
  MARKETPLACE_DOMAIN   = 'appstore.' + BASE_DOMAIN

end
