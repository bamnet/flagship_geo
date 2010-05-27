class Point < ActiveRecord::Base

  #Validations
  validates :name, :presence => true
  validates :longitude, :numericality => true, :inclusion => { :in => -180..180 }
  validates :latitude, :numericality => true, :inclusion => { :in => -90..90}
end
