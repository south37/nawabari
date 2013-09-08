class User < ActiveRecord::Base
  attr_accessible :foursq_id, :territory

  validates :foursq_id, :territory, presence: true
  validates :foursq_id, numericality: { only_integer: true }
  validates :territory, numericality: { greater_than_or_equal_to: 0 }
end
