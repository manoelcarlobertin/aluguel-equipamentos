class Equipament < ApplicationRecord
  has_many :schedules
  has_many :rents
end
