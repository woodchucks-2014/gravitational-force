class Rating < ActiveRecord::Base
  belongs_to :rater, class_name: :User
  belongs_to :ratee, class_name: :User
  belongs_to :trait

  validates_presence_of :ratee_id, :rater_id, :value

end
