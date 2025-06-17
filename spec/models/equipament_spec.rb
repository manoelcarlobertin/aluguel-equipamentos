require 'rails_helper'

RSpec.describe Equipament, type: :model do
  describe '.availables' do
    let!(:equip_available) { Equipament.create!(name: 'Disponível') }
    let!(:equip_booked) { Equipament.create!(name: 'Reservado') }

    before do
      # Cria um agendamento que bloqueia o equipamento reservado
      Schedule.create!(
        equipament: equip_booked,
        period_start: Date.parse('2025-06-10'),
        period_end: Date.parse('2025-06-15')
      )
    end

    it 'retorna equipamentos sem agendamento no período' do
      period_start = Date.parse('2025-06-12')
      period_end = Date.parse('2025-06-16')

      result = Equipament.availables(period_start, period_end)

      expect(result).to include(equip_available)
      expect(result).not_to include(equip_booked)
    end
  end
end
