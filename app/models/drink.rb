class Drink < ApplicationRecord
  validates :name, presence: true
  validates :picture_url, presence: true
  has_many :drink_stops
end
