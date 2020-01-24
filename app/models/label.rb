class Label < ApplicationRecord
  has_many :labelings, dependent: :destroy
  has_many :users, through: :labelings
end
