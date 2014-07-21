class RatingsController < ApplicationController
  include UsersHelper

    def index
    @user = User.find(params[:user_id])
    @ratings = []
    Trait.all.each do |trait|
      rating = Rating.where(ratee_id: @user.id, rater_id: current_user.id, trait_id: trait.id).first
      rating ||= Rating.new(ratee_id: @user.id, rater_id: current_user.id, trait_id: trait.id)
      @ratings << rating
    end
  end

  def create
    print "\n\n\n\n\n\n\n\n\n"
    p params
    print "\n\n\n\n\n\n\n\n\n"
    redirect_to root_path
  end

end
