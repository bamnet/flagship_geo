xml.Placemark(:id => "polygon_#{polygon.id}") do 
  xml.name polygon.name
  xml.description do 
    xml.cdata! polygon.description
  end 
  xml.Polygon do
    xml.outerBoundaryIs do
      xml.LinearRing do
        xml.coordinates do
          polygon.coords.each do |coord|
            xml.text! "#{coord.longitude},#{coord.latitude} \n" 
          end
        end
      end
    end 
  end 
end