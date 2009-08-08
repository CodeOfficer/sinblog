require 'rubygems'
$:.unshift File.join(File.dirname(__FILE__), 'vendor', 'sinatra', 'lib')
require 'vendor/sinatra/lib/sinatra'
require File.join(File.dirname(__FILE__), 'lib', 'sinblog')
require 'haml'
require 'sass'
# require 'logger'
require 'vendor/rack-bug/lib/rack/bug'


#  -----------------------------------------------------------------------------

set :public, 'public'
set :views,  'views'
set :haml, { :format => :html5 }
set :sass, { :style => :compact }
set :logging, true

#  -----------------------------------------------------------------------------

configure do
  puts "LOADING CONFIGURATION"
  # Log = Logger.new(File.join('logs', "#{Sinatra::Application.environment}.log")) 
  # Log.level  = Logger::INFO
  # use Rack::CommonLogger, Log
  use Rack::Bug
end

error do
  'Sorry there was a nasty error - ' + env['sinatra.error'].name
end

not_found do
  'This is nowhere to be found!!'
end

helpers do
  include Rack::Utils
  alias_method :h, :escape_html
end

#  -----------------------------------------------------------------------------

get '/' do
  # Log.info "get '/'"
  haml :index
end

get '/hello/:name' do |n|
  # Log.info "get '/hello/:name'"
  h "Hello #{n}!"
end

get '/stylesheets/application.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :application
end