xml.Placemark(:id => "point_#{point.id}") do 
  xml.name point.name 
  xml.description do 
    xml.cdata! point.description 
  end 
  xml.Point do 
    xml.coordinates "#{point.longitude},#{point.latitude}" 
  end 
end 
