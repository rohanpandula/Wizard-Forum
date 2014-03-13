require 'csv'


class Article
  attr_reader :data
  def initialize (title,description,url,wizard_name)
    @data = {}
    @data[:title]=title
    @data[:description]=description
    @data[:url]=url
    @data[:wizard_name]=wizard_name
  end
  def write_to_csv
    CSV.open('pointy_hats.csv', 'a+') do |csv|
      csv << @data.values
    end
  end

  def read_from_csv
    file = File.read('pointy_hats.csv')
    csv = CSV.parse(file)
    csv.find {|row| row[2] == @data[:url]}
  end
end