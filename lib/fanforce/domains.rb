module Fanforce

  if ENV['RACK_ENV'] == 'development'
    TOP_LEVEL_DOMAIN  = ENV['FANFORCE_GEM_TOP_LEVEL_DOMAIN'] || 'gg'
    BASE_DOMAIN       = ENV['FANFORCE_GEM_BASE_DOMAIN'] || 'fanforce.' + TOP_LEVEL_DOMAIN
    SMARTURL_DOMAIN   = 'fanforc.gg'
    FF_APP_DOMAIN     = 'ffapp.gg'
    FF_PLUGIN_DOMAIN  = 'ffplugin.gg'
    FF_WIDGET_DOMAIN  = 'ffwidget.gg'

  elsif ENV['RACK_ENV'] == 'test'
    BASE_DOMAIN       = 'fanforce.gg'
    SMARTURL_DOMAIN   = 'fanforc.gg'
    FF_APP_DOMAIN     = 'ffapp.gg'
    FF_PLUGIN_DOMAIN  = 'ffplugin.gg'
    FF_WIDGET_DOMAIN  = 'ffwidget.gg'

  elsif ENV['RACK_ENV'] == 'staging'
    BASE_DOMAIN       = 'fanforce-staging.com'
    SMARTURL_DOMAIN   = 'fanforc.us'
    FF_APP_DOMAIN     = 'ffapp.us'
    FF_PLUGIN_DOMAIN  = 'ffplugin.us'
    FF_WIDGET_DOMAIN  = 'ffwidget.us'

  else
    BASE_DOMAIN       = 'fanforce.com'
    SMARTURL_DOMAIN   = 'fanforce.io'
    FF_APP_DOMAIN     = 'ffapp.io'
    FF_PLUGIN_DOMAIN  = 'ffplugin.io'
    FF_WIDGET_DOMAIN  = 'ffwidget.io'
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
