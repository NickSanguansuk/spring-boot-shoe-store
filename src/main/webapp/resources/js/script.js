
// ---------- ---------- ---------- ---------- ----------
// For card (hover)

//$(document).ready(function () {
//    // executes when HTML-Document is loaded and DOM is ready
//    console.log("document is ready");
//
//
//    $(".card").hover(
//        function () {
//            $(this).addClass('shadow-lg').css('cursor', 'pointer');
//        }, function () {
//            $(this).removeClass('shadow-lg');
//        }
//    );
//
//// document ready
//});

// ---------- ---------- ---------- ---------- ----------
// For map

mapboxgl.accessToken = 'pk.eyJ1Ijoid3Nhbmd1YW5zdWsiLCJhIjoiY2t1djJ0MWZpNjRvcTJubzh3Nnd4aTR6aSJ9.uGCOx8LfekPAPWHwAyNn4g';
let map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v11',
    center: [-87.668839, 41.904732],
    //zoom: 18,
    zoom: 14,
});

const geoJson = {
    type: 'FeatureCollection',
    features: [
        {
            type: 'Feature',
            geometry: {
                type: 'Point',
                coordinates: [-87.668839, 41.904732]
            },
            properties: {
                title: 'Mapbox',
                description: 'FeetFirst Shoe Store'
            }
        },
    ]
};

// Add markers to map
for (const {geometry, properties} of geoJson.features) {
    // create a HTML element for each feature
    const el = document.createElement('div');
    el.className = 'marker';

    // make a marker for each feature and add to the map
    new mapboxgl.Marker(el).setLngLat(geometry.coordinates).addTo(map);
}

// ---------- ---------- ---------- ---------- ----------











