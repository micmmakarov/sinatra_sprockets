class App < Sinatra::Base
  set :haml, :format => :html5

  set :assets, Sprockets::Environment.new

# Configure sprockets
  settings.assets.append_path "app/assets/javascripts"
  settings.assets.append_path "app/assets/stylesheets"


  get "/" do
    puts "fucken #{assets}"
    haml :index, :layout => :fuck
  end

  get "/javascripts/:file.js" do
    content_type "application/javascript"
    settings.assets["#{params[:file]}.js"]
  end

  get "/stylesheets/:file.css" do
    content_type "text/css"
    settings.assets["#{params[:file]}.css"]
    haml :index, :layout => :fuck
  end

end