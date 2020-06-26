class AddCategoryIdToMoviesTable < ActiveRecord::Migration
  def change
    add_column :movies, :category_id, :string
  end
end
