require './lib/project'
require './lib/volunteer'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require "pg"
also_reload 'lib/**/*.rb'

DB = PG.connect({:dbname => "volunteer_tracker"})

get ('/') do

end
