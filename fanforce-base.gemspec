# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fanforce/base/version'

Gem::Specification.new do |gem|
  gem.name     = 'fanforce-base'
  gem.version  = Fanforce::Base::VERSION
  gem.date     = Time.now.utc.strftime('%Y-%m-%d')
  gem.summary  = %q{The base gem used by other fanforce gems}

  gem.authors  = ['Caleb Clark']
  gem.email    = ['cclark@fanforce.com']
  gem.homepage = 'http://github.com/fanforce/gem-fanforce-base'

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_runtime_dependency 'rack', '~> 1.5.2'
  gem.add_runtime_dependency 'addressable', '~> 2.3.6'
  gem.add_runtime_dependency 'multi_json', '>= 1.7.2'
end
