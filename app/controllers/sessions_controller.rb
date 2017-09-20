class SessionsController < ApplicationController
  def new
  end

  def admin
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      #redirect_to 'pages/start_quiz'
      redirect_to :controller => 'pages', :action => 'home'
      #render 'pages/after_login'
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def admin_create
    user = User.find_by(email: params[:session][:email], admin: params[:session][:admin].to_i)
    if user && user.authenticate(params[:session][:password])
      admin_log_in user
      #redirect_to 'pages/start_quiz'
      redirect_to :controller => 'pages', :action => 'admin_home'
      #render 'pages/after_login'
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'admin'
    end
  end

  def create_fb
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    #session[:current]
    log_out
    redirect_to root_url
    #redirect_to :controller => 'pages', :action => 'start_quiz', :current => @current
  end

  def admin_destroy
    #session[:current]
    admin_log_out
    redirect_to root_url
    #redirect_to :controller => 'pages', :action => 'start_quiz', :current => @current
  end
end
