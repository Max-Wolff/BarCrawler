class Bar < ApplicationRecord
  has_many :stops
  validates :name, presence: true
  validates :rating, presence: true, :inclusion => 1..5
  validates :address, presence: true
  validates :photo_url, presence: true
  validates :category, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
