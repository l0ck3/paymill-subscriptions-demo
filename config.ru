require 'rubygems'
require 'slim'
require 'sequel'


require './db/schema'
require './app/app'
require './config/assets'

run Sinatra::Application

require './db/seeds'
