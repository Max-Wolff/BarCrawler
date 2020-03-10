class Group < ApplicationRecord
  has_many :members
  has_many :stops
  has_many :bars, through: :stops
  has_many :drink_stops, through: :stops
end
