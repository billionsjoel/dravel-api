class Trip < ApplicationRecord
  has_many :reservations

  validates :name, presence: true
  validates :destination, presence: true
  validates :vip, presence: true
  validates :price, presence: true
  validates :image, presence: true
  validates :description, presence: true
end
