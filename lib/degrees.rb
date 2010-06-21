class Numeric
  # Convert a degrees unit to radians.
  #
  # e.g. 45.degrees => 0.785398163397448
  def degrees
    self * Math::PI / 180 
  end
  
  # Convert a radians unit to degrees.
  #
  # e.g 0.785398163397448.radians => 45.0
  def radians
    self * 180 / Math::PI
  end
end