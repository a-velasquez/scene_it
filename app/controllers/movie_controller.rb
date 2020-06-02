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
      #  binding.pry
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

  #read one instance

  get '/movies/:id' do
    if logged_in?
      @movie = Movie.find_by_id(params[:id])
      erb :'movies/show'
    else
      redirect '/login'
    end
  end

  #render edit form
  get '/movies/:id/edit' do
    if logged_in?
      @movie = Movie.find_by_id(params[:id])
      erb :'movies/edit'
    else
      redirect '/login'
    end
  end

  patch '/movies/:id' do
    if params[:title] == "" || params[:genre] == "" || params[:description] == "" || params[:rating] == ""
      redirect to "/movies/#{params[:id]}/edit"
    else
      @movie = Movie.find_by_id(params[:id])
      @movie.title = params[:title]
      @movie.genre = params[:genre]
      @movie.content = params[:content]
      @movie.rating = params[:rating]
      @movie.user_id = current_user.id
      @movie.save
      redirect to "/movies/#{@movie.id}"
    end
  end


end
