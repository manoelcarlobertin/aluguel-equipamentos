require 'rails_helper'

RSpec.describe "equipaments/edit", type: :view do
  let(:equipament) {
    Equipament.create!(
      name: "MyString",
      description: "MyText",
      available: false,
      price: "MyString",
      per: "MyString",
      day: 1
    )
  }

  before(:each) do
    assign(:equipament, equipament)
  end

  it "renders the edit equipament form" do
    render

    assert_select "form[action=?][method=?]", equipament_path(equipament), "post" do

      assert_select "input[name=?]", "equipament[name]"

      assert_select "textarea[name=?]", "equipament[description]"

      assert_select "input[name=?]", "equipament[available]"

      assert_select "input[name=?]", "equipament[price]"

      assert_select "input[name=?]", "equipament[per]"

      assert_select "input[name=?]", "equipament[day]"
    end
  end
end
