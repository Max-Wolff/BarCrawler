class Group < ApplicationRecord
  has_many :members
  validates :name, presence: true
end
