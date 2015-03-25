require 'spec_helper'

describe "entries/new" do
  before(:each) do
    assign(:entry, stub_model(Entry,
      :food => "MyText",
      :situation => "MyText"
    ).as_new_record)
  end

  it "renders new entry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", entries_path, "post" do
      assert_select "textarea#entry_food[name=?]", "entry[food]"
      assert_select "textarea#entry_situation[name=?]", "entry[situation]"
    end
  end
end
