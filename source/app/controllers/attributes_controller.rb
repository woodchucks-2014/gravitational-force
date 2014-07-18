class AttributesController < ApplicationController
  def index
    @attributes = Attribute.all
  end
end
