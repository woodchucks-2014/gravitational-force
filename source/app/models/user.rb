class User < ActiveRecord::Base
  has_secure_password

  has_many :rated_users, foreign_key: :rating_user_id, class_name: 'Rating'
  has_many :user_ratings, foreign_key: :rated_user_id, class_name: "Rating"
  has_many :traits, through: :ratings

  validates_presence_of :name, :email
  validates_uniqueness_of :email
  validates :email, format: {with: /[-0-9a-zA-Z.+_]+@[-0-9a-zA-Z.+_]+\.[a-zA-Z]{2,}/}

end
