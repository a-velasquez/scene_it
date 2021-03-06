class Movie < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  validates :title, :release_date, :description, :rating, presence: true #uses ActiveRecord Class Method to check that the specified attributes are not blank
end
