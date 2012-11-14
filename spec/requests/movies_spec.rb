require 'spec_helper'

describe "Movies" do
  describe "GET /movies" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      #get movies_index_path
      #response.status.should be(200)
    end
  end
end

describe "get similar movies" do

	before do
		Movie.create(title: 'm1', director: 'abc')
		Movie.create(title: 'm2', director: 'abc')
		Movie.create(title: 'm3', director: 'def')

		id = Movie.find_by_title 'm1'
		@movie_list = Movie.find_directors(id)
	end
	
	it "should return list of movies with matching directors" do
		assert @movie_list[0] == 'm1'
		assert @movie_list[1] == 'm2'
	end

	it "should not return other directors" do
		assert @movie_list.length == 2
		#assert @movie_list.length == 1
	end
end


