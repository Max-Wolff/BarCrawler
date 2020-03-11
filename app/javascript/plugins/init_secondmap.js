import mapboxgl from 'mapbox-gl';

const initSecondMap = () => {
  const mapElement = document.getElementById('secondmap');

  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: {
      top: 120,
      bottom: 120,
      right: 70,
      left: 70
    }, maxZoom: 15, duration: 0 });
  };

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'secondmap',
      style: 'mapbox://styles/encierro/ck7khdd3f04tm1ip7m49lq24p'
    });


    map.addControl(new mapboxgl.GeolocateControl({ positionOptions: { enableHighAccuracy: true }, trackUserLocation: true }));

    map.addControl(new mapboxgl.NavigationControl());

    map.addControl(new mapboxgl.FullscreenControl());

    map.on('load', function() {
      map.resize();
    })

    const markers = JSON.parse(mapElement.dataset.markers);

    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

      let i = 1;

      const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'contain';
      element.style.width = '60px';
      element.style.height = '60px';

      new mapboxgl.Marker(element)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(map);
    });
    fitMapToMarkers(map, markers);

    if (mapElement.dataset.route) {
      map.on('load', function() {
        map.addSource('route', {
          'type': 'geojson',
          'data': {
            'type': 'Feature',
            'properties': {},
            'geometry': {
              'type': 'LineString',
              'coordinates': JSON.parse(mapElement.dataset.route)
            }
          }
        });
        map.addLayer({
          'id': 'route',
          'type': 'line',
          'source': 'route',
          'layout': {
            'line-join': 'round',
            'line-cap': 'round'
          },
          'paint': {
            'line-color': '#FCC228',
            'line-width': 8
          }
        });
      });
    }
  }
};

export { initSecondMap };
