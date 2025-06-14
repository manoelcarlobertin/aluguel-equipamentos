class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :equipament

  validates :started_at, :finished_at, presence: true
  validate :data_fim_maior_que_inicio

  def data_fim_maior_que_inicio
    return if finished_at.blank? || started_at.blank?
    errors.add(:finished_at, "deve ser maior que a data de início") if finished_at <= started_at
  end
end
