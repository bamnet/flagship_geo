xml.Folder do
  @polygons.each do |polygon|
    xml << render(:partial => 'show', :locals => {:polygon => polygon})
  end
end 