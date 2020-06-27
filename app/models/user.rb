class User < ActiveRecord::Base
  # has_many :categories, :dependent => :destroy
  has_many :movies
  # has_many :categories, through: :movie_categories

  has_secure_password #works with bcrypt gem to 'salt' users password
  validates_uniqueness_of :username #makes sure that all usernames are unique to prevent duplicates
  validates :username, :email, :password, presence: true #validates user input, make sure fields are not left blank
end
