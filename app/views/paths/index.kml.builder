xml.Folder do
  xml << render(:partial => 'layers/style', :locals => {:layer => @layer})
  @paths.each do |path|
    xml << render(path)
  end
end 