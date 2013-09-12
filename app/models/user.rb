class User < ActiveRecord::Base
  attr_accessible :foursq_id, :name, :territory

  validates :foursq_id, :name, :territory, presence: true
  validates :foursq_id, numericality: { only_integer: true, greater_than: 0 }
  validates :foursq_id, uniqueness: true
  validates :territory, numericality: { greater_than_or_equal_to: 0 }
end
