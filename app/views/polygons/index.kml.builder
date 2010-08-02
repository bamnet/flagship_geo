xml.Folder do
  xml << render(:partial => 'layers/style', :locals => {:layer => @layer})
  @polygons.each do |polygon|
    xml << render(polygon)
  end
end 