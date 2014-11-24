require 'simplecov'
SimpleCov.start { add_filter '/test/' }

require 'rubygems'
require 'minitest/autorun'
require 'minitest/spec'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

require 'fanforce/base'
