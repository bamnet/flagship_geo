xml.Folder do
  @paths.each do |path|
    xml << render(:partial => 'show', :locals => {:path => path})
  end
end 