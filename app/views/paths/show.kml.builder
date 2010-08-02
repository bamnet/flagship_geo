xml.Folder do
  xml << render(:partial => 'layers/style', :locals => {:layer => @path.layer})
  xml << render(@path)
end