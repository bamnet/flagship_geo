require 'test_helper'

class PointTest < ActiveSupport::TestCase
  # Test to verify point attributes are set
  test "point attributes must be set" do
    point = Point.new
    assert point.invalid?
    assert point.errors[:name].any?
  end
  
  # The latitude be valid.
  # The valid range for a latitude should be
  # -90 <= x <= 90.
  test "latitude  must be valid" do
    point = Point.new(:name => "Test Point")
    assert point.valid?, "0,0 is valid"
    
    good = [0, 10.5, -1.1, 90, -90]
    bad = ["a", "", nil, -90.1, 90.00001]
    
    good.each do |lat|
      point = Point.new(:name => "A Point",
                        :latitude => lat)
      assert point.valid?, "#{lat} should be valid"
    end
    
    bad.each do |lat|
      point = Point.new(:name => "A Point",
                        :latitude => lat)
      assert point.invalid?, "#{lat} should be invalid"
    end
  end
  
  # The longitude be valid.
  # The valid range for a latitude should be
  # -180 <= x <= 180.
  test "longitude  must be valid" do
    point = Point.new(:name => "Test Point")
    assert point.valid?, "0,0 is valid"
    
    good = [0, 10.5, -1.1, 180, -180]
    bad = ["a", "", nil, -180.1, 180.00001]
    
    good.each do |long|
      point = Point.new(:name => "A Point",
                        :longitude => long)
      assert point.valid?, "#{long} should be valid"
    end
    
    bad.each do |long|
      point = Point.new(:name => "A Point",
                        :longitude => long)
      assert point.invalid?, "#{long} should be invalid"
    end
  end
end
