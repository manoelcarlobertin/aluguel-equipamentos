class Equipament < ApplicationRecord
  has_many :schedules
  has_many :rents

  def self.availables(period_start, period_end)
    left_outer_joins(:schedules) # traz todos os equipamentos.
      .where("schedules.id IS NULL OR NOT (schedules.period_start <= ? AND schedules.period_end >= ?)", period_end, period_start)
      # a condição where filtra os sem agendamento OU equipos que NÃO sobrepôem perído informado.
      .distinct # evita equipos repetidos na lista.
  end
end
