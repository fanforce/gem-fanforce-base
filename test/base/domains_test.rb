require 'test_helper'

describe Fanforce::Base::Domains do

  [:test,:development,:staging,:production].each do |rack_env| it "should return domains for #{rack_env}" do
    ENV['RACK_ENV'] = rack_env.to_s
    assert Fanforce.environ.is_a?(Symbol)

    assert Fanforce.base_domain == Fanforce::Base::DomainEnvironments.method(rack_env.to_s).call[:base]
    assert Fanforce.default_short_domain == Fanforce::Base::DomainEnvironments.method(rack_env.to_s).call[:default_short_domain]
    assert Fanforce.apps_base_domain == Fanforce::Base::DomainEnvironments.method(rack_env.to_s).call[:apps_base]

    assert Fanforce.api_domain
    assert Fanforce.api_domain_ssl
    assert Fanforce.eye_domain
    assert Fanforce.controller_domain
    assert Fanforce.uranium_domain
    assert Fanforce.website_domain
    assert Fanforce.developers_domain
    assert Fanforce.app_domain
    assert Fanforce.signup_domain
  end end

end
