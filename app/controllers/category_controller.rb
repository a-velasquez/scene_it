class CategoryController < ApplicationController

  get '/categories/new' do
    if logged_in?
      erb :'categories/new'
    else
      redirect '/login'
    end
  end

  post '/categories' do
    @user = current_user
    @category = Category.create(name: params[:category], user_id: @user.id)
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


  private

  def get_category
    @category = Category.find_by_id(params[:id])
  end

  def load_all_categories
    @categories = Category.all
  end

end
