class UserController < ApplicationController

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
      @user = User.create(username: params[:username], email: params[:email], password: params[:password]) #uses ActiveRecord .create to
      if @user.save                                                                                        #create and persist user to db
        set_session_id     #sets session id, logs user in
        redirect '/movies'
      else
        redirect '/signup'
      end
    end
  end

  get '/login' do
    if logged_in?
      redirect '/movies'
    else
      erb :'users/login'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password]) #checks is user exists and uses Activerecord method to authenticate user's password
      set_session_id
      redirect '/movies'
    else
      redirect '/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.clear   #clears the user_id from the session hash
      redirect '/login'
    else
      redirect '/login'
    end
  end

  private #only accessible through public methods that call set_session_id

  def set_session_id
    session[:user_id] = @user.id #sets the :user_id value in session hash to user's id
  end

end
