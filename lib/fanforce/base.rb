require_relative 'base/version'

class Fanforce
  class Base
    require_relative 'base/domains'
    require_relative 'base/internal_utils'
    require_relative 'base/utils'
  end
  include Base::Utils
  include Base::Domains
  Utils = Base::Utils
end
