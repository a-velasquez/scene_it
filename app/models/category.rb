class Category < ActiveRecord::Base
 has_many :movies, :dependent => :destroy
 belongs_to :user
end
