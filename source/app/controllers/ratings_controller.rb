class RatingsController < ApplicationController

    def index
    @user = User.find(params[:user_id])
    # @ratings = []
    # Trait.all.each do |trait|
    #   rating =  Rating.where(rated_user_id: @user.id, trait_id: trait.id).first
    #   rating ||= Rating.new(rated_user_id: @user.id, rating_user_id: current_user.id, trait_id: trait.id)
    #   @traits << rating
    # end
  end

  def create
    redirect_to traits_path
  end

  def fuck
  end

end
