class CategoryController < ApplicationController

  get '/categories/new' do
    if logged_in?
      @movies = current_user.movies
      erb :'categories/new'
    else
      redirect '/login'
    end
  end

  post '/categories' do
    @user = current_user
    @category = Category.create(name: params[:category], user_id: @user.id)
    if @category.save
      erb :'categories/show'
    else
      redirect '/categories/new'
    end
  end


#show all
  get '/categories' do
    load_all_categories
    erb :'categories/index'
  end

  #show one

  get '/categories/:id' do
    get_category
    erb :'categories/show'
  end

  get '/categories/:id/edit' do
    get_category
    erb :'categories/edit'
  end


  private

  def get_category
    @category = Category.find_by_id(params[:id])
  end

  def load_all_categories
    @categories = Category.all
  end

end
