xml.Folder do
  xml << render(:partial => 'layers/style', :locals => {:layer => @polygon.layer})
  xml << render(@polygon)
end