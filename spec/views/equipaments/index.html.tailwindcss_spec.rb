require 'rails_helper'

RSpec.describe "equipaments/index", type: :view do
  before(:each) do
    assign(:equipaments, [
      Equipament.create!(
        name: "Name",
        description: "MyText",
        available: false,
        price: "Price",
        per: "Per",
        day: 2
      ),
      Equipament.create!(
        name: "Name",
        description: "MyText",
        available: false,
        price: "Price",
        per: "Per",
        day: 2
      )
    ])
  end

  it "renders a list of equipaments" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Price".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Per".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
