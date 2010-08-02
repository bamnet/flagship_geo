xml.Style(:id => "layer_#{layer.id}") do
  xml.IconStyle do
    xml.color to_kmlcolor(layer.color)
  end
  xml.LineStyle do
    xml.color to_kmlcolor(layer.color)
  end
  xml.PolyStyle do
    xml.color to_kmlcolor(layer.color)
  end
end