 class Trait < ActiveRecord::Base
  has_many :ratings
  has_many :users, through: :ratings, source: :ratee
 end
