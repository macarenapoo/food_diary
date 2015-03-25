require 'spec_helper'

describe "Creating entries" do
	def create_entry(options={})
		options[:food] ||= "Quinoa Salad"
		options[:situation] ||= "It was time for lunch. I was starving!"

		visit "/entries"
		click_link "New Entry"
		expect(page).to have_content("New entry")

		fill_in "Food", with: options[:food]
		fill_in "Situation", with: options[:situation]
		click_button "Create Entry"
	end

	it "redirects to the entries index page on success" do

		create_entry
		expect(page).to have_content("Quinoa Salad")

	end

	it "Displays an error when entry has no food" do
		
		create_entry food:""

		expect(page).to have_content("error")

		visit "/entries"
		expect(page).to_not have_content("It was time for lunch.")

	end

end