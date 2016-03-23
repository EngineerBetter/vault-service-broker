require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'json'
require 'yaml'

get "/" do
  Catalog.get("hello world")
end

get "/nothing/" do
  Catalog.get(nil)
end


