class Territory < ActiveRecord::Base
  belongs_to :user
  attr_accessible :been_here, :lat, :lng, :name, :venue_id, :user
end
