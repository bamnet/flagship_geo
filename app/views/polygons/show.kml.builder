xml = Builder::XmlMarkup.new(:indent => 2) 
xml.instruct! 
xml.kml(:xmlns => "http://www.opengis.net/kml/2.2") do 
  xml.Placemark(:id => @polygon.id) do 
    xml.name @polygon.name
    xml.description do 
      xml.cdata! @polygon.description
    end 
    xml.Polygon do
      xml.outerBoundaryIs do
        xml.LinearRing do
          xml.coordinates do
            @polygon.coords.each do |coord|
              xml.text! "#{coord.longitude},#{coord.latitude} \n" 
            end
          end
        end
      end 
    end 
  end
end