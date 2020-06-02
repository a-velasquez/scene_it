class MovieController < ApplicationController

  #CREATE
  get '/movies/new' do
    if logged_in?
      erb :'/movies/new'
    else
      redirect '/login'
    end
  end

  post '/movies' do
    if logged_in?
      @movie = current_user.movies.create(
        title: params[:title],
        genre: params[:genre],
        release_date: params[:release_date],
        description: params[:description],
        rating: params[:rating]
       )
       binding.pry
      redirect '/movies'
    else
      redirect '/login'
    end
  end

  #READ ALL
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
