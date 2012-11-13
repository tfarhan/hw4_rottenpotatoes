
Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create!(movie)
  end
  #flunk "Unimplemented"
end


When /^I go to the edit page for "(.*)"$/ do |movie|
	record = Movie.find_by_title(movie)
	id = record[:id]
	visit "/movies/#{id}/edit"
end

And /^I fill in "(.*)" with "(.*)"$/ do |column, name|
	fill_in column, with: name	
end

And /^I press "(.*)"$/ do |button|
	click_button(button)
end

Then /^the (.*) of "(.*)" should be "(.*)"$/ do |field, movie, name|
	record = Movie.find_by_title(movie)
	field_value = record[field.to_sym]
	assert_equal field_value, name
	#save_and_open_page	
end
