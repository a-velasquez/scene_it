class MovieController < ApplicationController

#CREATE
get '/movies/new' do
  if logged_in?
    erb :'/movies/new'
  else
    redirect '/login'
  end
end


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
