FactoryBot.define do
  factory :equipament do
    name { "Caixa de som stereo" }
    description { "Caixa grande com sound stereo super bass." }
    available { false }
    price_per_day { 100.00 }
  end
end
