class User < ActiveRecord::Base
  has_secure_password

  has_many :rated_users, foreign_key: :rating_user_id, class_name: 'Rating'
  has_many :user_ratings, foreign_key: :rated_user_id, class_name: "Rating"
  has_many :traits, through: :ratings

  validates_presence_of :name, :email
  validates_uniqueness_of :email
  validates :email, format: {with: /[-0-9a-zA-Z.+_]+@[-0-9a-zA-Z.+_]+\.[a-zA-Z]{2,}/}

  def user_score(trait)
    ratings = self.user_ratings.where(trait_id: trait.id).select{|rating| rating.rating_user_id != self.id}
    ratings.map! { |rating| rating.value }
    ratings.inject(:+) / ratings.length
  end

  def self_score(trait)
    self.user_ratings.find_by(trait_id: trait.id, rating_user_id: self.id, rated_user_id: self.id).value
  end

  def delta(trait)
    user_score(trait) - self_score(trait)
  end


end
