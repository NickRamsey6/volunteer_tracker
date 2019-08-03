require './lib/project'
require './lib/volunteer'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require "pg"
also_reload 'lib/**/*.rb'

DB = PG.connect({:dbname => "volunteer_tracker"})

get('/') do
  redirect to('/projects')
  # "This will be our home page."
end

get('/projects') do
  @projects = Project.all
  erb(:projects)
  # "This route will show a list of all projects -- May not need."
end

get('/projects/new') do
  erb(:new_project)
  # "This will take us to a page with a form for adding a new project."
end

post('/projects') do
  name = params[:project_name]
  project = Project.new({:name => name, :id => nil})
  project.save()
  redirect to('/projects')
  # "This route will add a project to our list of projects."
end

get('/projects/:id') do
  @project = Project.find(params[:id].to_i())
  erb(:project)
  # "This route will show a specific project based on its ID. The value of ID here is #{params[:id]}."
end

get('/projects/:id/edit') do
  @project = Project.find(params[:id].to_i())
  erb(:edit_project)
  # "This will take us to a page with a form for updating a project with an ID of #{params[:id]}."
end

patch('/projects/:id') do
  @project = Project.find(params[:id].to_i())
  @project.update(params[:name])
  redirect to('/projects')
  # "This route will update a project."
end

delete('/projects/:id') do
  @project = Project.find(params[:id].to_i())
  @project.delete()
  redirect to('/projects')
  # "This route will delete a project."
end
