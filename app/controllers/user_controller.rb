class UserController < ApplicationController

  #signup

  get '/signup' do
    if logged_in?
      redirect '/movies'
    else
      erb :'users/signup'
    end
  end

  post '/signup' do
    if logged_in?
      redirect '/movies'
    else


    end

  end

  #post signup




  #login



  #logout


end
