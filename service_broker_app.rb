require 'rubygems'
require 'bundler/setup'
require 'sinatra/base'
require 'json'
require 'yaml'
require_relative 'lib/broker_api'
unless ENV['PLATFORM'] == "cf"
  require 'dotenv'
  Dotenv.load
end

class ServiceBrokerApp < Sinatra::Application

  use Rack::Auth::Basic, "Authenticated Access" do |username, password|
    username == ENV['API_USER'] and password == ENV['API_PASS']
  end

  get '/v2/catalog' do
      content_type :json
      Service_catalog.new.get
  end

end
