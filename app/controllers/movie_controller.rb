class MovieController < ApplicationController

  get '/movies' do
    if logged_in?
      erb :'/movies/index'
    else
      redirect '/login'
    end
  end


end
