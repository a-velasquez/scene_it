class MovieController < ApplicationController

  get '/movies' do
    if logged_in?
      @user = current_user
      @movies = @user.movies.all
      binding.pry
      erb :'/movies/index'
    else
      redirect '/login'
    end
  end


end
