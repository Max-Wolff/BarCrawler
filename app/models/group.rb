class Group < ApplicationRecord
  has_many :members
  has_many :stops
  has_many :bars, through: :stops
  validates :name, presence: true
end
