require 'sinatra'
require 'csv'

require_relative 'article.rb'

articles = []
CSV.foreach('pointy_hats.csv') do |row|
 articles << [row[0], row[1], row[2], row[3]]
end


get '/index' do
@articles = articles
erb :index
end

get '/article' do
erb :article
end

post '/articles' do
@article = Article.new(params['title'], params['url_name'], params['descriptor'],params['wizard_name'])
@article.write_to_csv
#@article = readlines('pointy_hats.csv')
redirect '/index'
end

set :views, File.dirname(__FILE__) + '/views'
set :public_folder, File.dirname(__FILE__) + '/public'
