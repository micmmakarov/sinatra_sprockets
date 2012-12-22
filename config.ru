require 'rubygems'
require 'bundler'
#require "sprockets"

Bundler.require



#Sinatra::Sprockets.configure do |config|
#  config.app = App
#
#  ['stylesheets', 'javascripts', 'images'].each do |dir|
#    config.append_path(File.join('app', 'assets', dir))
#  end
#end

require './app/hi.rb'
run App


