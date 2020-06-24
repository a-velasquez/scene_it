require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'scene' #encryption key used to create session_id
  end

  get '/' do
    erb :index
  end

  helpers do #helpers is a Sinatra method. methods in this block are accessible to views and controllers

    def logged_in?
      !!current_user #calls current_user, and returns true or false, based on if a value is true or false. 
    end


    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id] #if there is a :user_id key in the session hash
    end                                                                          #it will look for that user by that session_id and then
                                                                                 #set the instance variable @current_user equal to that
    def authorized?(movie)                                                       #user. It will return nil if no user is found.
      movie.user == current_user #takes movie as an argument and uses comparison operator to check if movie object belongs to the current_user.
    end

  end

end
