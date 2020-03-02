class Group < ApplicationRecord
  has_many :members
  has_many :bars, through: :stops
  validates :name, presence: true
end
