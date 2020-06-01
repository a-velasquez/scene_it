class MovieController < ApplicationController


#read all
  get '/movies' do
    if logged_in?
      @user = current_user
      @movies = @user.movies.all
      erb :'/movies/index'
    else
      redirect '/login'
    end
  end


end
