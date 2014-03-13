require 'rspec'
require 'csv'
require_relative  '../article.rb'


describe Article do
  it 'stores title,url,description, wizard name in a hash' do
    article = Article.new('a','b','c','d')
    expect(article.data[:title].class).to eq(String)
    expect(article.data[:description].class).to eq(String)
    expect(article.data[:url].class).to eq(String)
    expect(article.data[:wizard_name].class).to eq(String)
  end
  it 'writes the info to a CSV' do
    article = Article.new('a','b','c','d')
    article.write_to_csv
    file = File.read('pointy_hats.csv')
    data =  CSV.parse(file)
    expect(data[-1]).to eq(["a", "b", "c", "d"])
  end

  it 'procures the things from the CSV' do
    article = Article.new('d','e','f','g')
    article.write_to_csv
    expect(article.read_from_csv).to eq(["d", "e", "f", "g"])
  end
end




