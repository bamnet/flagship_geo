class Point < ActiveRecord::Base
  # Relations
  belongs_to :layer

  # Validations
  validates :name, :presence => true
  validates :longitude, :numericality => true, :inclusion => { :in => -180..180 }
  validates :latitude, :numericality => true, :inclusion => { :in => -90..90}
  
  # The cartesian x coordinate of a point.
  def x
    require 'degrees'
    Math.cos(latitude.degrees) * Math.cos(longitude.degrees)
  end
  
  # The cartesian y coordinate of a point.
  def y
    require 'degrees'
    Math.cos(latitude.degrees) * Math.sin(longitude.degrees)
  end
  
  # The cartesian z coordinate of a point.
  def z
    require 'degrees'
    Math.sin(latitude.degrees)
  end
end
