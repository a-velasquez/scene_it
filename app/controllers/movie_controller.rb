class MovieController < ApplicationController

  get '/movies/new' do
    if logged_in?
      get_categories
      erb :'/movies/new'
    else
      redirect '/login'
    end
  end

  post '/movies' do
    if logged_in?
      @user = current_user
      @movie = Movie.create(title: params[:title],
      release_date: params[:release_date],
      description:params[:description],
      rating: params[:rating],
      category_id: params[:category],
      user_id: @user.id)
      if @movie.save
        redirect "/movies/#{@movie.id}"
      else
        redirect '/movies/new'
      end
    else
      redirect '/login'
    end
  end

  get '/movies' do
    if logged_in?
      @movies = current_user.movies
      erb :'/movies/index'
    else
      redirect '/login'
    end
  end

  get '/movies/:id' do
    get_movie
    if logged_in?
      if authorized?(@movie)
        erb :'movies/show'
      else
        redirect '/movies'
      end
    else
      redirect '/login'
    end
  end

  get '/movies/:id/edit' do
    if logged_in?
      get_movie && get_categories
      if authorized?(@movie)
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
      if @movie.update(title: params[:title],
        release_date: params[:release_date],
        description:params[:description],
        rating: params[:rating],
        category_id: params[:category]
        )
        redirect "/movies/#{@movie.id}"
      else
        redirect "/movies/#{@movie.id}/edit"
      end
    else
      redirect '/movies'
    end
  end

  get '/movies/:id/delete' do
    if logged_in?
      get_movie
        if authorized?(@movie)
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

  def get_categories
    @categories = current_user.categories
  end

end
