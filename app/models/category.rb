class Category < ActiveRecord::Base
 has_many :movies
 has_many :users, through: :movies

 validates :name, uniqueness: true 
end
