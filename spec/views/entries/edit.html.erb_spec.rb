require 'spec_helper'

describe "entries/edit" do
  before(:each) do
    @entry = assign(:entry, stub_model(Entry,
      :food => "MyText",
      :situation => "MyText"
    ))
  end

  it "renders the edit entry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", entry_path(@entry), "post" do
      assert_select "textarea#entry_food[name=?]", "entry[food]"
      assert_select "textarea#entry_situation[name=?]", "entry[situation]"
    end
  end
end
