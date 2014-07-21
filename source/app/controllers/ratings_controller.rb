class RatingsController < ApplicationController
  # include UsersHelper

    def index
    @user = User.find(params[:user_id])
    c_user = current_user
    @ratings = []
    Trait.all.each do |trait|
      rating = Rating.where(ratee_id: @user.id, rater_id: c_user.id, trait_id: trait.id).first
      rating ||= Rating.new(ratee_id: @user.id, rater_id: c_user.id, trait_id: trait.id)
      @ratings << rating
    end
  end

  def create
    Trait.all.each do |trait|
      if params["save_" + trait.name]
        new_rating = Rating.where(ratee_id: params["user_id"], rater_id: current_user.id, trait_id:trait.id).first
        new_rating ||= Rating.new
        new_rating.value = params[trait.name]["value"]
        new_rating.ratee_id = params["user_id"]
        new_rating.rater_id = current_user.id
        new_rating.trait_id = trait.id
        new_rating.save
      end
    end
    redirect_to root_path
  end

end
