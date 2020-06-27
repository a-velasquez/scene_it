class CreateMoviesTable < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string  :title
      t.integer :release_date
      t.text    :description
      t.integer :rating
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
