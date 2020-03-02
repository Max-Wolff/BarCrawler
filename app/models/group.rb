class Group < ApplicationRecord
  has_many :members
  validates :name, presence: true
  validates :token, presence: true, uniqueness: true
end
