require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'json'
require 'yaml'
require_relative 'lib/broker_api'

get '/v2/catalog' do
    Service_catalog.new.get
end
