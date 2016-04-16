class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find_by(params[:username])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Success. Please Log In"
      redirect_to login_path
    else
      flash[:alert] = "Alert: Username/Password is Invalid"
      render :new
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
