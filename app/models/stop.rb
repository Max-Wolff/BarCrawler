class Stop < ApplicationRecord
  has_many :drinks, through: :drink_stops
  belongs_to :group
  belongs_to :bar
  validates :rank, presence: true
end
