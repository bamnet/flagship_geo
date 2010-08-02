xml.Folder do
  xml << render(:partial => 'layers/style', :locals => {:layer => @layer})
  @points.each do |point|
    xml << render(point)
  end
end 