class GravitatesController < ApplicationController

  def index
    @users = User.all
    @traits = Trait.all
  end

  def graph
    trait_1 = Trait.find(params[:skill_1].values.first)
    trait_2 = Trait.find(params[:skill_2].values.first)
    user = User.find(params[:user].values.first)
    user_score_1 = user.user_score(trait_1)
    user_score_2 = user.user_score(trait_2)
    self_score_1 = user.self_score(trait_1)
    self_score_2 = user.self_score(trait_2)
    num_votes = user.num_votes(trait_1) + user.num_votes(trait_1)
    name = user.name
    name_perceived = user.name + " public perception"

    @response = {name: user.name,
                 name_perceived: name_perceived,
                 user_score_1: user_score_1,
                 user_score_2: user_score_2,
                 self_score_1: self_score_1,
                 self_score_2: self_score_2,
                 num_votes: num_votes,
                 skill_1_name: trait_1.name,
                 skill_2_name: trait_2.name
                 }
    render json: @response
  end

end
