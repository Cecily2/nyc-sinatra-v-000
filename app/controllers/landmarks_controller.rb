class LandmarksController < ApplicationController    
  get '/landmarks' do
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params["id"].to_i)
    erb :'landmarks/show'    
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params["id"].to_i)    
    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params["id"].to_i)    
    @landmark.update(params["landmark"])
    @landmark.save
    redirect "/landmarks/#{@landmark.id}"
  end

  post '/landmarks' do
    Landmark.create(params["landmark"])
    redirect "/landmarks"
  end


end
