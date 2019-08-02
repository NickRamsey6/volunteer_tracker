require './lib/project'
require './lib/volunteer'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
also_reload 'lib/**/*.rb'

get ('/') do

end
