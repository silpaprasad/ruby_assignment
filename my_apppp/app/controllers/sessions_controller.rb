class SessionsController < ApplicationController
   skip_before_action :ensure_login, only: [:new, :create]

  def new

  end


  def create
    user=User.find_by(name: params[:user][:name])
    password = params[:user][:password]
    if user && user.authenticate(password)
      session[:user_id] = user.id
      redirect_to root_path, notice: "succesfully logged in"
    else
      redirect_to login_path, alert:"Invalid user"
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: "you have been logged out"
  end
end
