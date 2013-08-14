$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'pry'
require 'rspec'
require 'simplecov'
require 'zengin'

SimpleCov.start do
  add_filter 'vendor/bundle'
end

RSpec.configure do |config|
  config.order = 'random'
end
