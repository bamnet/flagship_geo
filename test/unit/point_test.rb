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
  
  # Test that the 3 cartesian value functions for x, y, and z
  # work as expected.
  test "cartesion values" do
    tests = [
              {:latitude => 0, :longitude => 0,
              :answers => {:x => 1, :y=>0, :z => 0}},
              
              {:latitude => 90, :longitude => 90,
              :answers => {:x => 0, :y=>0, :z => 1}},
              
              {:latitude => 0, :longitude => 90,
              :answers => {:x => 0, :y=>1, :z => 0}},
              
              {:latitude => 90, :longitude => 0,
              :answers => {:x => 0, :y=>0, :z => 1}},
              
              {:latitude => 45, :longitude => 45,
              :answers => {:x => 0.5, :y=>0.5, :z => (1/Math.sqrt(2))}}
            ]
            
    tests.each do |data|
      point = Point.new(:name => "Test Point", :latitude => data[:latitude], :longitude => data[:longitude])
      threshold = 0.000001
      assert_in_delta point.x, data[:answers][:x], threshold, "Lat: #{data[:latitude]}, Long: #{data[:longitude]}"
      assert_in_delta point.y, data[:answers][:y], threshold, "Lat: #{data[:latitude]}, Long: #{data[:longitude]}"
      assert_in_delta point.z, data[:answers][:z], threshold, "Lat: #{data[:latitude]}, Long: #{data[:longitude]}"
    end    
  end
end
