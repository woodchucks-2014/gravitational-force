class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params(params))
    if @user.save
      session[:user] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = "Failed"
      redirect_to new_user_path
    end
  end

  def show
    flash[:notice] = "Successful log in!"
    @user = User.find(params[:id])
  end

 private

  def user_params(params)
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
