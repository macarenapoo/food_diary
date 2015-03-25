require 'spec_helper'

describe "Editing entries" do
	def edit_entry(options={})
		options[:food] ||= "Quinoa Salad"
		options[:situation] ||= "It was time for lunch. I was starving!"
		
		entry = options[:entry]

		visit "/entries"
		within "#entry_#{entry.id}" do
			click_link "Edit"
		end

		fill_in "Food", with: options[:food]
		fill_in "Situation", with: options[:situation]
		click_button "Update Entry"
	end

	it "Updates an Entry" do

		entry = Entry.create(food: "Quinoa Salad", situation: "It was lunch, and I was starving!")
		

		edit_entry entry: entry, 
							 food: "Sandwich",
							 situation: "Dinner Time!"

		entry.reload

		expect(page).to have_content("Entry was successfully updated")
		expect(entry.food).to eq("Sandwich")
		expect(entry.situation).to eq("Dinner Time!")

	end

	it "Updates an Entry with no title" do

		entry = Entry.create(food: "Quinoa Salad", situation: "It was lunch, and I was starving!")
		

		edit_entry entry: entry, 
							 food: "",
							 situation: "Dinner Time!"

		entry.reload

		expect(page).to have_content("error")
		visit "/entries"
		expect(page).to_not have_content("Dinner Time!")
	
	end

	

end