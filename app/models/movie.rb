class Movie < ActiveRecord::Base
  belongs_to :user

  validates :title, :genre, :release_date, :description, :rating, presence: true

  # def self.valid_params?(params)
  #   return !params[:title].empty? && !params[:genre].empty? && !params[:release_date].empty? && !params[:description].empty? && !params[:rating].empty?
  # end
end
