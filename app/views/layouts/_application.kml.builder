xml = Builder::XmlMarkup.new(:indent => 2) 
xml.instruct! 
xml.kml(:xmlns => "http://www.opengis.net/kml/2.2") do
  xml << yield
end