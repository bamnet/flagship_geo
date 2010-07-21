xml = Builder::XmlMarkup.new(:indent => 2) 
xml.instruct! 
xml.kml(:xmlns => "http://www.opengis.net/kml/2.2") do 
  xml.Placemark(:id => @path.id) do 
    xml.name @path.name
    xml.description do 
      xml.cdata! @path.description
    end 
    xml.LineString do
      xml.coordinates do
        @path.coords.each do |coord|
        xml.text! "#{coord.longitude},#{coord.latitude} \n" 
        end 
      end
    end 
  end 
end 