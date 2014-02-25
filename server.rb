require 'sinatra'

get '/' do
  @tasks = ['pay bills', 'buy milk', 'learn Ruby' ]
  erb :index
end

set :views, File.dirname(__FILE__) + '/views'
set :public_folder, File.dirname(__FILE__) + '/public'
