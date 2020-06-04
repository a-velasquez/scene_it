class Movie < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :genre, presence: true
  validates :release_date, presence: true 
end
