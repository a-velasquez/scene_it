class User < ActiveRecord::Base
  has_many :movies

  has_secure_password
  validates_uniqueness_of :username #makes sure that all usernames are unique to prevent duplicates
end
