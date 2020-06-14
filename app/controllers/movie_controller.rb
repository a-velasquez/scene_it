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
      if @movie.save
        redirect "/movies/#{@movie.id}"
      else
        redirect '/movies/new'
      end
    else
      redirect '/login'
    end
  end

  #READ ALL
  get '/movies' do
    if logged_in?
      @movies = current_user.movies
      erb :'/movies/index'
    else
      redirect '/login'
    end
  end

  #read one instance

  get '/movies/:id' do
    get_movie
    if logged_in?
      if authorized?(@movie) #checks to see if particualar movie belongs to user
        erb :'movies/show'
      else
        redirect '/movies'
      end
    else
      redirect '/login'
    end
  end

  #render edit form
  get '/movies/:id/edit' do
    if logged_in?
      get_movie
      if authorized?(@movie) #ensure user can't modify movies saved by others
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
    if authorized?(@movie)
      if Movie.valid_params?(params)
        @movie.update(
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
          @movie.destroy
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

# post '/movies' do
#   if logged_in?
#     if @movie = Movie.valid_params?(params) #validates user inputs before creating movie
#       @movie = current_user.movies.create(
#         title: params[:title],
#         genre: params[:genre],
#         release_date: params[:release_date],
#         description: params[:description],
#         rating: params[:rating]
#         )
#         redirect "/movies/#{@movie.id}"
#       else
#         redirect '/movies/new'
#       end
#   else
#     redirect '/login'
#   end
# end

# post '/movies' do
#   if logged_in?
#     @movie = current_user.movies.create(
#       title: params[:title],
#       genre: params[:genre],
#       release_date: params[:release_date],
#       description: params[:description],
#       rating: params[:rating]
#       )
#     if @movie.valid?
#       redirect "/movies/#{@movie.id}"
#     else
#       redirect '/movies/new'
#     end
#   else
#     redirect '/login'
#   end
# end
