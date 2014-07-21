
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

  def point_distance(trait_1, trait_2) #finds distance between two points
    x_self = self.self_score(trait_1)
    y_self = self.self_score(trait_2)
    x_per = self.user_score(trait_1)
    y_per = self.user_score(trait_2)
    p x_per - x_self
    p y_per - y_self
    dist = ((x_self - x_per)**2 + (y_self - y_per)**2)**(0.5)
    dist.floor
  end

  def discrepancy(trait_1, trait_2)
    x_self = self.self_score(trait_1)
    y_self = self.self_score(trait_2)
    x_per = self.user_score(trait_1)
    y_per = self.user_score(trait_2)
    if (x_self - x_per) + (y_self - y_per) >= 0
      return true
    else
      return false
    end
  end

  def self.perception(trait_1, trait_2) #perception is "higher"
    filter = User.all.select { |user| user.discrepancy(trait_1, trait_2) == false }
    filter.sort_by{ |user| user.point_distance(trait_1, trait_2) }.last
  end

  def self.individual(trait_1, trait_2) #self rating is "higher"
    filter = User.all.select { |user| user.discrepancy(trait_1, trait_2) == true }
    filter.sort_by{ |user| user.point_distance(trait_1, trait_2) }.last
  end

  def self.accurate(trait_1, trait_2) #most on point
    all.sort_by{|user| user.point_distance(trait_1, trait_2)}.first
  end

  def self.deluded(trait_1, trait_2) #most inaccurate perception
    all.sort_by{|user| user.point_distance(trait_1, trait_2)
      }.last
  end

end
