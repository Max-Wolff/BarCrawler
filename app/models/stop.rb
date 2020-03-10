class Stop < ApplicationRecord
  has_many :drink_stops
  has_many :drinks, through: :drink_stops
  belongs_to :group
  belongs_to :bar
end
