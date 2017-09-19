class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      #redirect_to 'pages/start_quiz'
      redirect_to :controller => 'pages', :action => 'start_quiz'
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    #session[:current]
    log_out
    redirect_to root_url
    #redirect_to :controller => 'pages', :action => 'start_quiz', :current => @current
  end
end
