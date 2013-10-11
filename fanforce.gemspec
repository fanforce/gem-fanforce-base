# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fanforce/version'

Gem::Specification.new do |gem|
  gem.name        = 'fanforce'
  gem.version     = Fanforce::VERSION
  gem.date        = Time.now.utc.strftime('%Y-%m-%d')
  gem.summary     = %q{Core Fanforce gem}
  gem.description = %q{Core gem used internally by other Fanforce gems}
  gem.authors     = ['Caleb Clark']
  gem.email       = ['cclark@fanforce.com']
  gem.homepage    = 'http://github.com/fanforce/fanforce'

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_runtime_dependency 'rack'
  gem.add_runtime_dependency 'oj',         '~> 2.1.4'
  gem.add_runtime_dependency 'multi_json', '>= 1.7.2'
end
