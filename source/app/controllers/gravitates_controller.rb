class GravitatesController < ApplicationController
  include UsersHelper
  def index
    @users = User.all
    @traits = Trait.all
  end

  def graph
    params[:skill_1] = params[:skill_1].values.first
    params[:skill_2] = params[:skill_2].values.first
    @response = make_hash(params, User.find(params[:user].values.first))
    render json: @response
  end

  def filter_request
    m = User.method(params[:request])
    user = m.call(Trait.find(params[:skill_1].to_i), Trait.find(params[:skill_2].to_i))
    @response = make_hash(params, user)
    render json: @response
  end

  def make_hash(params, ratee)
    current_user
    trait_1 = Trait.find(params[:skill_1])
    trait_2 = Trait.find(params[:skill_2])
    response = { name: ratee.name,
                 user_score_1: ratee.user_score(trait_1),
                 user_score_2: ratee.user_score(trait_2),
                 self_score_1: ratee.self_score(trait_1),
                 self_score_2: ratee.self_score(trait_2),
                 my_score_1: @user.my_score(trait_1, ratee),
                 my_score_2: @user.my_score(trait_2, ratee),
                 my_rating_1: @user.user_score(trait_1),
                 my_rating_2: @user.user_score(trait_2),
                 num_votes_1: ratee.num_votes(trait_1),
                 num_votes_2: ratee.num_votes(trait_2),
                 skill_1_name: trait_1.name,
                 skill_2_name: trait_2.name,
                 trait_1_id: trait_1.id,
                 trait_2_id: trait_2.id
                 }
  end


end
