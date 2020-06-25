class MovieController < ApplicationController

  #CREATE MOVIE
  
  get '/movies/new' do
    if logged_in?
      erb :'/movies/new'
    else
      redirect '/login'
    end
  end

  post '/movies' do
    if logged_in?
      movie = current_user.movies.create( #uses ActiveRecord association collection method to instantiate new instance of movie associated 
        title: params[:title],            #with the current_user's foreign key. Also triggers validations using .create
        genre: params[:genre],
        release_date: params[:release_date],
        description: params[:description],
        rating: params[:rating]
        )
      if movie.save                       #if movie is saved (and passes validations) redirect to individual movie
        redirect "/movies/#{movie.id}"
      else
        redirect '/movies/new'
      end
    else
      redirect '/login'
    end
  end

  #READ MOVIE
  
  get '/movies' do
    if logged_in?
      @movies = current_user.movies #Association collection method to query current_user's movies
      erb :'/movies/index'
    else
      redirect '/login'
    end
  end

  get '/movies/:id' do
    get_movie                #uses private method get_movie to find movie by id
    if logged_in?
      if authorized?(@movie) #uses helper method to check if particualar movie belongs to user
        erb :'movies/show'
      else
        redirect '/movies'
      end
    else
      redirect '/login'
    end
  end

  #UPDATE MOVIE
  
  get '/movies/:id/edit' do
    if logged_in?
      get_movie
      if authorized?(@movie) #ensures user can't modify movies saved by others
        erb :'movies/edit'
      else
        redirect '/movies'
      end
    else
      redirect '/login'
    end
  end

  patch '/movies/:id' do
    get_movie
    if authorized?(@movie)    #ensures movie belongs to current user
      if @movie.update(       #uses ActiveRecord validation to validate user inputs and update movie attributes if params are valid
        title: params[:title],
        genre: params[:genre],
        release_date: params[:release_date],
        description: params[:description],
        rating: params[:rating]
        )
        redirect "/movies/#{@movie.id}"
      else
        redirect "/movies/#{@movie.id}/edit"
      end
    else
      redirect '/movies'
    end
  end


  #DELETE MOVIE
  
  get '/movies/:id/delete' do
    if logged_in?
      get_movie
        if authorized?(@movie) #ensures movie belongs to current user
          @movie.destroy       #clears db of all records associated with movie object
          redirect '/movies'
        else
          redirect '/movies'
        end
    else
      redirect '/login'
    end
  end

  private

  def get_movie
    @movie = Movie.find_by(id: params[:id])
  end

end
