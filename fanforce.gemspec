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
end
