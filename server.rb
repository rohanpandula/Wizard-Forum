require 'sinatra'
require 'csv'
require 'pry'
require_relative 'article.rb'

articles = []
CSV.foreach('pointy_hats.csv') do |row|
 articles << Article.new(row[0], row[1], row[2], row[3])
end


get '/index' do
@articles = articles
erb :index
end

get '/create-article' do
erb :create-article
end

post '/create-article' do
@article = Article.new(params['title'], params['url_name'], params['descriptor'],params['wizard_name'])
@article.write_to_csv
#@article = readlines('pointy_hats.csv')
redirect '/'
end

set :views, File.dirname(__FILE__) + '/views'
set :public_folder, File.dirname(__FILE__) + '/public'
