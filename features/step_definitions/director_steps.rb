
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

Given /^I am on the details page for "(.*)"$/ do |movie|
	record = Movie.find_by_title(movie)
	#click_link "More about #{movie}"
	visit movie_path record.id
end

When /^I follow "Find Movies With Same Director"$/ do
	click_link "Find Movies With Same Director"
end

Then /^I should be on the Similar Movies page for "(.*)"$/ do |movie|
	page.has_content? "Similar Movies for #{movie}"
end

#And /^I should see "THX-1138"$/ do
#	page.has_text? 'THX-1138'
#end

#But /^I should not see "Blade Runner"$/ do
#	page.has_no_text? 'Blade Runner'
#end

Then /^I should be on the home page$/ do
	save_and_open_page
	current_path.should eq(movie_path)
end

And /^I should see "(.*)"$/ do |text|
	save_and_open_page
	page.has_content? text
end