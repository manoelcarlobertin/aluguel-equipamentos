FactoryBot.define do
  factory :rent do
    user { "user@email.com" }
    equipament { "Caixa de som stereo" }
    started_at { "2025-06-13 19:50:08" }
    finished_at { "2025-06-15 19:50:08" }
  end
end
