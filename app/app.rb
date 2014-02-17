require 'sinatra'
require 'sinatra/assetpack'

register Sinatra::AssetPack


require_relative 'models/user'
require_relative 'models/article'
require_relative 'support/session'


helpers do
  def subscribed?
    current_user && current_user.subscribed?
  end

  def protect
    redirect '/login' unless current_user
  end
end

get '/' do
  protect
  @articles = Article.all
  slim :index
end


get '/subscribe/:amount' do
  @amount = params[:amount]
  slim :subscribe
end

post '/subscribe/:amount' do
  amount = params[:amount]
  token  = params[:paymillToken]

  offer        = Paymill::Offer.all(amount: amount).first
  payment      = Paymill::Payment.create(token: token)
  subscription = Paymill::Subscription.create(offer: offer.id, payment: payment.id)

  current_user.update(subscription: subscription.id)

  redirect '/'
end
