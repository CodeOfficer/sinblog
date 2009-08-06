require 'rubygems'
$:.unshift File.join(File.dirname(__FILE__), 'vendor', 'sinatra', 'lib')
require 'sinatra'
require File.join(File.dirname(__FILE__), 'lib', 'sinblog')
require 'haml'
require 'sass'

set :public, 'public'
set :views,  'views'
set :haml, { :format => :html5 }
set :sass, { :style => :compact }

configure do
  puts "LOADING CONFIGURATION"
end

error do
  'Sorry there was a nasty error - ' + env['sinatra.error'].name
end

not_found do
  'This is nowhere to be found!!'
end

helpers do
  def testit
    'yyy'
  end
end


get '/' do
  haml :index
end

get '/hello/:name' do |n|
  "Hello #{n}!" + testit
end

get '/stylesheets/application.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :application
end