class User < ApplicationRecord
  has_many :rents
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
