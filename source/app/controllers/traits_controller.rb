class TraitsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @traits = Trait.all
  end
  def create
    redirect_to traits_path
  end
end
