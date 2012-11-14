# == Schema Information
#
# Table name: movies
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  rating       :string(255)
#  description  :text
#  release_date :datetime
#  created_at   :datetime
#  updated_at   :datetime
#  director     :string(255)
#

class Movie < ActiveRecord::Base

  attr_accessible :title, :rating, :release_date, :description, :director, :description

  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  def self.find_directors (id)
  	movie_obj = Movie.find id
  	director = movie_obj.director

  	#movie_list = Movie.find(:title, conditions: ['director = ?' director])
	movie_list = Movie.where(:director => director)

  	title_list = Array.new  	
  	movie_list.each do |movie|
  		if movie.title != movie_obj.title
	  		title_list << movie.title
	  	end
  	end

  	return title_list
  end

end
