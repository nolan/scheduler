class Team < ActiveRecord::Base
  include Geokit::Mappable
  acts_as_mappable :auto_geocode => true
  
  validates_uniqueness_of :name
  
  def address
    "#{city}, #{state}"
  end
end
