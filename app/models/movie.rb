class Movie < ActiveRecord::Base
  belongs_to :user # foreign key - user_id
  has_many :movie_categories
  has_many :categories, through: :movie_categories
  validates :title, :release_date, :description, :rating, presence: true #uses ActiveRecord Class Method to check that the specified attributes are not blank
end
