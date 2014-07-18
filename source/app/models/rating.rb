class Rating < ActiveRecord::Base
  belongs_to :rating_user, :foreign_key =>  "user_id", class_name: "User"
  belongs_to :rated_user, :foreign_key => "user_id", class_name: "User"
  belongs_to :trait
end
