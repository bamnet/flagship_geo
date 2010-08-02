xml.Folder do
  xml << render(:partial => 'layers/style', :locals => {:layer => @point.layer})
  xml << render(@point)
end