require 'rubygems'
require 'bundler/setup'
require 'dotenv'
Dotenv.load
require 'sinatra/base'
require 'json'
require 'yaml'
require_relative 'lib/broker_api'


class ServiceBrokerApp < Sinatra::Application

  use Rack::Auth::Basic, "Authenticated Access" do |username, password|
    username == 'admin' and password == 'admin'
  end

  get '/v2/catalog' do
      content_type :json
      Service_catalog.new.get
  end

end
