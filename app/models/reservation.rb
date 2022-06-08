class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  validates :trip_id, presence: true
  validates :date, presence: true
end
