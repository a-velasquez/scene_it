class CreateCategoriesTable < ActiveRecord::Migration
  def change
    create_table  :categories do |t|
      t.string :name
      t.integer :user_id
      t.integer :movie_id
    end
  end
end
