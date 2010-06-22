module PointsHelper

  # Identify the midpoint of a series of points.
  # Uses a center of gravity technique, based off the 
  # cartesian coordinates for each point.
  # Logic from: http://www.geomidpoint.com/calculation.html
  def midpoint(points = [])
    x = y = z = 0
    points.each do |point|
      x += point.x
      y += point.y
      z += point.z
    end
    x, y, z = x/points.length, y/points.length, z/points.length
    longitude = Math.atan2(y, x).radians
    hypotenuse = Math.sqrt(x * x + y * y)
    latitude = Math.atan2(z, hypotenuse).radians
    
    Point.new(:name => "Midpoint", :latitude => latitude, :longitude => longitude)
  end

end
