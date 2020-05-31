class CreateMoviesTable < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genre
      t.integer :release_date
      t.text :description
      t.integer :rating
      t.integer :user_id 
    end
  end
end
