class RatingsController < ApplicationController
  include UsersHelper

  def index
    @user = current_user
    @ratee = User.find(params[:user_id])
    @ratings = []
    Trait.all.each do |trait|
      rating = Rating.find_by(ratee_id: @ratee.id, rater_id: @user.id, trait_id: trait.id)
      rating ||= Rating.new(ratee_id: @ratee.id, rater_id: @user.id, trait_id: trait.id)
      @ratings << rating
    end
  end

  def create
    @user = current_user
    Trait.all.each do |trait|
      if params["save_" + trait.name]
        new_rating = Rating.where(ratee_id: params["user_id"], rater_id: @user.id, trait_id:trait.id).first
        new_rating ||= Rating.new
        new_rating.value = params[trait.name]["value"]
        new_rating.ratee_id = params["user_id"]
        new_rating.rater_id = @user.id
        new_rating.trait_id = trait.id
        new_rating.save
      end
    end
    redirect_to root_path
  end


end
