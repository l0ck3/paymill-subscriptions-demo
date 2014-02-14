require 'rubygems'
require 'slim'
require 'sequel'
require 'paymill'

require './config/secret'

require './db/schema'
require './app/app'
require './config/assets'

Paymill.api_key = settings.paymill_private_key

run Sinatra::Application

require './db/seeds'
