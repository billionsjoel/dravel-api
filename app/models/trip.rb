class Trip < ApplicationRecord
  has_many :reservations

  validates :name, presence: true
  validates :destination, presence: true
  validates_inclusion_of :vip, in: [true, false]
  validates :price, presence: true
  validates :image, presence: true
  validates :description, presence: true
end
