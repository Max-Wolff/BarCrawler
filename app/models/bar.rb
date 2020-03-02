class Bar < ApplicationRecord
  has_many :stops
  validates :name, presence: true
  validates :rating, presence: true, :inclusion => 1..5
  validates :address, presence: true
  validates :picture_url, presence: true
  validates :category, presence: true
end
