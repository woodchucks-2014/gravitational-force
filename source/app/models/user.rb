class User < ActiveRecord::Base
  has_secure_password

  has_many :received_ratings, class_name: :Rating, foreign_key: :ratee_id
  has_many :submitted_ratings, class_name: :Rating, foreign_key: :rater_id
  has_many :traits, through: :received_ratings

  validates_presence_of :name, :email
  validates_uniqueness_of :email
  validates :email, format: {with: /[-0-9a-zA-Z.+_]+@[-0-9a-zA-Z.+_]+\.[a-zA-Z]{2,}/}

  def user_score(trait)
    ratings = self.received_ratings.where(trait_id: trait.id).select{|rating| rating.rater_id != self.id}
    ratings.map! { |rating| rating.value }
    ratings.inject(:+) / ratings.length
  end

  def num_votes(trait) # submitted or received?
    ratings = self.received_ratings.where(trait_id: trait.id).select{|rating| rating.rater_id != self.id}
    ratings.size
  end

  def self_score(trait)
    self.received_ratings.find_by(trait_id: trait.id, rater_id: self.id, ratee_id: self.id).value
  end

  def delta(trait) #higher means low self esteem
    user_score(trait) - self_score(trait)
  end

  def self.low_esteem(trait) #least self esteem
    all.sort_by{|user| user.delta(trait)}.last
  end

  def self.high_esteem(trait) #person who thinks highest of themself inaccurately
    all.sort_by{|user| user.delta(trait)}.first
  end

  def self.accurate(trait) #most on point
    all.sort_by{|user| user.delta(trait).abs}.first
  end

  def self.deluded(trait) #most inaccurate perception
    all.sort_by{|user| user.delta(trait).abs}.last
  end

end
