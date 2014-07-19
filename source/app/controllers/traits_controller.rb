class TraitsController < ApplicationController
  def index
    @traits = Trait.all
  end
end
