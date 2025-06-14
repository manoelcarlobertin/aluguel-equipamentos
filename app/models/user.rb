class User < ApplicationRecord
  has_many :rents

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def admin?
    self.admin == true
  end
end
