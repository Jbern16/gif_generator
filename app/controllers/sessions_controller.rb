class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Success"
      redirect_to user_path(user)
    else
      flash[:alert] = "Invalid Login"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to gifs_path
  end

end
