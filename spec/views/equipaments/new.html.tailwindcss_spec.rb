require 'rails_helper'

RSpec.describe "equipaments/new", type: :view do
  before(:each) do
    assign(:equipament, Equipament.new(
      name: "MyString",
      description: "MyText",
      available: false,
      price: "MyString",
      per: "MyString",
      day: 1
    ))
  end

  it "renders new equipament form" do
    render

    assert_select "form[action=?][method=?]", equipaments_path, "post" do

      assert_select "input[name=?]", "equipament[name]"

      assert_select "textarea[name=?]", "equipament[description]"

      assert_select "input[name=?]", "equipament[available]"

      assert_select "input[name=?]", "equipament[price]"

      assert_select "input[name=?]", "equipament[per]"

      assert_select "input[name=?]", "equipament[day]"
    end
  end
end
