class CategoryController < ApplicationController


#show all
  get '/categories' do
    @categories = Category.all
    erb :'categories/index'
  end

  #show one

  get '/categories/:id' do
    @categories = Category.all
    erb :'categories/show'
  end


  private

  def get_category
    @category = Category.find_by_id(params[:id])
  end

end
