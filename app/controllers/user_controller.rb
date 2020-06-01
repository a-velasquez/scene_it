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
      @user = User.create(username: params[:username], password: params[:password])
      if @user.save
        session[:user_id] = @user.id #sets session id, logs user in
        redirect '/movies'
      else
        redirect '/signup'
      end
    end
  end

  #login

  get '/login' do
    if logged_in?
      redirect '/movies'
    else
      erb :'users/login'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user
      redirect '/posts'
    else
      redirect '/login'
    end
  end

  #logout
  get '/logout' do
    if logged_in?
      session.clear
      redirect '/login'
    else
      redirect '/login'
    end
  end


end
