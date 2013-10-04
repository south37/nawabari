class User < ActiveRecord::Base
  has_many :territories
  attr_accessible :foursq_id, :name, :area

  validates :foursq_id, :name, :area, presence: true
  validates :foursq_id, numericality: { only_integer: true, greater_than: 0 }
  validates :foursq_id, uniqueness: true
  validates :area, numericality: { greater_than_or_equal_to: 0 }

  def self.find_by_foursq_id(id)
    self.find(:first, :conditions => ["foursq_id = :foursq_id", { foursq_id: id }])
  end
end
