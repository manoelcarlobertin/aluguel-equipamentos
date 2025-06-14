require 'rails_helper'

RSpec.describe Rent, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:equipament) }
  it { should validate_presence_of(:started_at) }
  it { should validate_presence_of(:finished_at) }

  it "valida que data_fim é maior que data_inicio" do
    rent = Rent.new(started_at: Date.today, finished_at: Date.yesterday)
    rent.validate
    expect(rent.errors[:finished_at]).to include("deve ser maior que a data de início")
  end
end
