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
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end


    def authorized?(movie)
      movie.user == current_user 
    end



  end

end
