# spec/spec_helper.rb
require 'simplecov'
SimpleCov.start
require 'rspec'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

require File.expand_path '../../vault_broker_app.rb', __FILE__

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

# For RSpec 2.x and 3.x
RSpec.configure { |c| c.include RSpecMixin }
