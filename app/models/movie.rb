class Movie < ActiveRecord::Base
  belongs_to :user
  validates :title, :genre, :release_date, :description, :rating, presence: true
end
