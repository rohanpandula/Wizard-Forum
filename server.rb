require 'sinatra'

# stating that our static files are in the 'public' folder
set :public_folder, File.dirname(__FILE__) + '/public'

get '/' do
  tasks = ['pay bills', 'buy milk', 'learn Ruby' ]

  html = '''
  <!DOCTYPE html>
  <html lang="en">
    <head>
      <title>Basic HTML Page</title>
      <link rel="stylesheet" href="home.css" />
    </head>

    <body>
      <h1>TODO list</h1>

      <ul>
  '''


  tasks.each do |task|
    html += "<li>#{task}</li>"
  end

  html += '''
        </ul>
      </body>
    </html>
    '''
end
