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
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
end
