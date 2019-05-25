var map;
function initMap(lati, lngi)
{

  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: lati, lng: lngi},
    zoom: 8
  });

  fetch('https://sheltered-woodland-96290.herokuapp.com/api/v1/jobs')
    .then(function(response){return response.json()})
    .then(plotMarkers);
}

var locations;
var bounds;

function plotMarkers(m)
{
  locations = [];
  bounds = new google.maps.LatLngBounds();

  m.forEach(function (location) {
    var position = new google.maps.LatLng(location.latitude, location.longitude);

    locations.push(
      new google.maps.Marker({
        position: position,
        map: map,
        animation: google.maps.Animation.DROP,
      })
    );
    bounds.extend(position);

  });

  map.fitBounds(bounds);
}
