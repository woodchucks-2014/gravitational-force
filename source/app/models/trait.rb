 class Trait < ActiveRecord::Base

  has_many :ratings
  has_many :users, through: :ratings # => Might be optional for you guys ("Kai/Lex")
 end
