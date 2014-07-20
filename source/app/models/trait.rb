 class Trait < ActiveRecord::Base

  has_many :ratings
  #has_many :users, through: :ratings, foreign_key: :rated_user_id
 end
