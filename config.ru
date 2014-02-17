require 'rubygems'
require 'slim'
require 'sequel'
require 'paymill'

require './db/schema'

require './app/app'

require './config/secret'
require './config/assets'

Paymill.api_key = settings.paymill_private_key

run Sinatra::Application

require './db/seeds'

unless Paymill::Offer.all.any?
  Paymill::Offer.create amount: 9900,   currency: "EUR", interval: "1 MONTH", name: "1 month"
  Paymill::Offer.create amount: 27500,  currency: "EUR", interval: "3 MONTH", name: "3 months"
  Paymill::Offer.create amount: 90000,  currency: "EUR", interval: "1 YEAR",  name: "12 months"
end
