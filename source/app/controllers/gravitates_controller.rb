class GravitatesController < ApplicationController

  def index
    @users = User.all
    @traits = Trait.all
  end
end
