class Marker < ApplicationRecord
  # belongs_to :user

  validates :status, presence: true
  validates :address, presence: true
  validates :address, uniqueness: true
  validates :description, length: { in: 10..500 }
  validates :zip_code, presence: true
end
