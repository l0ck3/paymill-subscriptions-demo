require 'sinatra'
require 'sinatra/assetpack'

register Sinatra::AssetPack

require_relative 'models/user'
require_relative 'models/article'
require_relative 'support/session'


helpers do
  def subscribed?
    current_user && current_user.subscribed
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


