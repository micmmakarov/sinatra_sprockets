class App < Sinatra::Base
  set :haml, :format => :html5

  set :assets, Sprockets::Environment.new

# Configure sprockets
  settings.assets.append_path "app/assets/javascripts"
  settings.assets.append_path "app/assets/stylesheets"

  try_paths = [
      %w{ assets },
      %w{ app },
      %w{ app assets },
      %w{ vendor },
      %w{ vendor assets },
      %w{ lib },
      %w{ lib assets }
  ].inject([]) do |sum, v|
    sum + [File.join(v, 'javascripts'), File.join(v, 'stylesheets')]
  end
  binding.pry
  ([root] + ::Sinatra.rubygems_latest_specs.map(&:full_gem_path)).each do |root_path|
    try_paths.map {|p| File.join(root_path, p) }.
        select {|p| File.directory?(p) }.
        each {|path| settings.assets.append_path(path) }
  end



  get "/" do
    haml :index, :layout => :fuck
    binding.pry
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