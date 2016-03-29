require 'rubygems'
require 'bundler/setup'
require 'sinatra/base'
require 'json'
require 'yaml'
require_relative 'lib/broker_api'



class ServiceBrokerApp < Sinatra::Application

  get '/v2/catalog' do
      Service_catalog.new.get
  end

end
