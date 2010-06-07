require 'test_helper'

class LayerTest < ActiveSupport::TestCase
  # Test to verify layer attributes are set
  test "layer attributes must be set" do
    layer = Layer.new
    assert layer.invalid?
    assert layer.errors[:name].any?
    assert layer.errors[:color].any?
  end

  # Verify the hex color attribute is a valid color
  test "hex color validation" do
    good = ["#000000", "#FfFfFf", "#012345", "#6789AB", "#CDEFab", "#cdef00"]
    bad = ["#00000", "FFFFFF", "dog", 0, nil, "#Ghi123", "#-10000"]
    
    good.each do |hex|
      layer = Layer.new(:name => "Test", :color => hex)
      assert layer.valid?, "#{hex} should be valid"
    end
    
    bad.each do |hex|
      layer = Layer.new(:name => "Test", :color => hex)
      assert layer.invalid?, "#{hex} should not be valid"
    end
  end
end
