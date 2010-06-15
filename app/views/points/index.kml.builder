xml = Builder::XmlMarkup.new(:indent => 2) 
xml.instruct! 
xml.kml(:xmlns => "http://www.opengis.net/kml/2.2") do 
  xml.Folder do
    @points.each do |point|
      xml.Placemark(:id => point.id) do 
        xml.name point.name 
        xml.description do 
          xml.cdata! point.description 
        end 
        xml.Point do 
          xml.coordinates "#{point.longitude},#{point.latitude}" 
        end 
      end 
    end
  end
end 