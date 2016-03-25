require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'json'
require 'yaml'
require_relative 'lib/broker_api'

get '/:message' do
    Service_catalog.new.get(params['message'])
end
