xml.Folder do
  @points.each do |point|
    xml << render(:partial => 'show', :locals => {:point => point})
  end
end 