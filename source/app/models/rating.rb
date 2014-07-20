class Rating < ActiveRecord::Base
  belongs_to :rating_user, :foreign_key =>  "user_id", class_name: "User"
  belongs_to :rated_user, :foreign_key => "user_id", class_name: "User"
  belongs_to :trait

  validates_presence_of :rated_user_id, :rating_user_id, :value

end
