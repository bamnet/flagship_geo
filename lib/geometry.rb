# Provide some geometric values based on a latitude and longitude.
# 
# Requires the ability to convert a longitude and latitude
# to degrees.
module Geometry

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