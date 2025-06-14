require 'rails_helper'

RSpec.describe "equipaments/show", type: :view do
  before(:each) do
    assign(:equipament, Equipament.create!(
      name: "Name",
      description: "MyText",
      available: false,
      price: "Price",
      per: "Per",
      day: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Price/)
    expect(rendered).to match(/Per/)
    expect(rendered).to match(/2/)
  end
end
