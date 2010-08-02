xml.Document(:id => "layer_#{@layer.id}") do
  xml.name @layer.name
  xml.description do 
    xml.cdata! @layer.description
  end

  xml << render(:partial => 'style', :locals => {:layer => @layer})
  
  @layer.points.each do |point|
    xml << render(point)
  end
  
  @layer.paths.each do |path|
    xml << render(path)
  end
  
  @layer.polygons.each do |polygon|
    xml << render(polygon)
  end
end 