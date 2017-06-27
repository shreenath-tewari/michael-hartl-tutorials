class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = "Login Failed: Invalid Email/Password"
      render 'new'
    end
  end

end
