class UserController < ApplicationController

  #signup

  get '/signup' do
    if logged_in?
      redirect '/movies'
    else
      erb :'users/signup'
    end
  end


  #get signup
  



  #post signup




  #login



  #logout


end
