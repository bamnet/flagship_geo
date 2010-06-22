// Create a new map, centered around 
// center_point, with the specified
// zoomlevel, and put it in the identified
// div (defaults to "map_canvas")
function setup_map(center_point, zoom_level, div){
  div = div || "map_canvas"; //A default value
  var center = new google.maps.LatLng(center_point.latitude, center_point.longitude);
  var options = {
    zoom: zoom_level,
    center: center,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  var map = new google.maps.Map(document.getElementById(div), options);
  return map;
}

// Add a point (marker) to a map object.
// The point should be an object with a
// name, description, latitude, and longitude.
function add_point_to_map(point, map){
  var infowindow = new google.maps.InfoWindow({
    content: point.description
  });
  
  var marker = new google.maps.Marker({
    position: new google.maps.LatLng(point.latitude, point.longitude), 
    map: map,
    title:point.name
  });
  
  google.maps.event.addListener(marker, 'click', function() {
    infowindow.open(map, marker);
  });
}