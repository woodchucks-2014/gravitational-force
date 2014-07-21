class GravitatesController < ApplicationController
  helper :all
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
    p params
    m = User.method(params[:request])
    user = m.call(Trait.find(params[:skill_1].to_i), Trait.find(params[:skill_2].to_i))
    @response = make_hash(params, user)
    render json: @response
  end

  def make_hash(params, user)
    trait_1 = Trait.find(params[:skill_1])
    trait_2 = Trait.find(params[:skill_2])
    response = { name: user.name,
                 name_perceived: user.name + " perceived",
                 user_score_1: user.user_score(trait_1),
                 user_score_2: user.user_score(trait_2),
                 self_score_1: user.self_score(trait_1),
                 self_score_2: user.self_score(trait_2),
                 num_votes: user.num_votes(trait_1) + user.num_votes(trait_2),
                 skill_1_name: trait_1.name,
                 skill_2_name: trait_2.name,
                 trait_1_id: trait_1.id,
                 trait_2_id: trait_2.id
                 }
  end


end
