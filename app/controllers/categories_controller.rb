class CategoryController < ApplicationController


  #Create
  get '/category/new' do
    if logged_in?
      erb :'/category/new'
    else
      redirect '/login'
    end
  end

  post '/movies' do
    if logged_in?
      category = movies.categories.create( #uses ActiveRecord association collection method to instantiate new instance of movie associated
        name: params[:name]          #with the current_user's foreign key. Also triggers validations using .create
        )
      if category.save                       #if movie is saved (and passes validations) redirect to individual movie
        redirect "/categories/#{category.id}"
      else
        redirect '/category/new'
      end
    else
      redirect '/login'
    end
  end

  #read
  get '/categories' do
    if logged_in?
      @category = movie.categories #Association collection method to query current_user's movies
      erb :'/categories/index'
    else
      redirect '/login'
    end
  end

end
