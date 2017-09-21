class FiguresController < ApplicationController

  get '/figures' do
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params["id"].to_i)
    erb :'figures/show'    
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params["id"].to_i)    
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params["id"].to_i)    
    @figure.update(params["figure"])

    if params["title"]
      new_title = Title.create(params["title"])
      @figure.titles << new_title
    end

    if params["landmark"]
      new_landmark = Landmark.create(params["landmark"])
      @figure.landmarks << new_landmark
    end

    @figure.save
    redirect "/figures/#{@figure.id}"

  end

  post '/figures' do
    new_figure = Figure.create(params["figure"])
    if params["title"]
      new_title = Title.create(params["title"])
      new_figure.titles << new_title
    end

    if params["landmark"]
      new_landmark = Landmark.create(params["landmark"])
      new_figure.landmarks << new_landmark
    end

    new_figure.save
  end



end