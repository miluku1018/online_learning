class Course < ApplicationRecord
  enum currency: { 台幣: 0 }

  validates :price, :valid_period, numericality: { greater_than: 0 }
end
