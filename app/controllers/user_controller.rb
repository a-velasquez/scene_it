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
      @user = User.create(username: params[:username], email: params[:email], password: params[:password])
      if @user.save
        set_session_id #sets session id, logs user in
        binding.pry
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
    if @user && @user.authenticate(params[:password]) #uses Activerecord method to authenticate users password
      set_session_id
      redirect '/movies'
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

  private

  def set_session_id
    session[:user_id] = @user.id
  end

end
