class Category < ActiveRecord::Base
 has_many :movies
 belongs_to :user
end
