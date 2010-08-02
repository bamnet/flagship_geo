xml.Placemark(:id => "path_#{path.id}") do 
  xml.name path.name
  xml.description do 
    xml.cdata! path.description
  end
  xml.styleUrl "#layer_#{path.layer.id}"
  xml.LineString do
    xml.coordinates do
      path.coords.each do |coord|
        xml.text! "#{coord.longitude},#{coord.latitude} \n" 
      end 
    end
  end 
end