function initMap(lat, lng) {
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: lat, lng: lng},
    zoom: 8
  });

  fetch('https://sheltered-woodland-96290.herokuapp.com/api/v1/jobs')
    .then(function(response){return response.json()})
    .then(plotMarkers);
}

function plotMarkers(m)
{
  var bounds = new google.maps.LatLngBounds();

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

function initMap2(lat, lng) {
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 12,
    center: {lat: lat, lng: lng},
  });

  var marker = new google.maps.Marker({
    position: {lat: lat, lng: lng},
    map: map
  });
}
