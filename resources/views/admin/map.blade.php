{{-- <!-- Leaflet CSS -->
<link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />

<!-- Leaflet JS -->
<script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>

<div id="map" style="height: 400px;"></div>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        var lat = {{ $latitude }};
        var lng = {{ $longitude }};

        var map = L.map('map').setView([lat, lng], 13);

        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '© OpenStreetMap contributors'
        }).addTo(map);

        L.marker([lat, lng]).addTo(map)
            .bindPopup('Location')
            .openPopup();
    });
</script>

 --}}

 <div id="map" style="height: 400px; width: 100%;"></div>

 <script>
    function initMap() {
        const location = { lat: {{ $latitude }}, lng: {{ $longitude }} };

        const map = new google.maps.Map(document.getElementById("map"), {
            zoom: 15,
            center: location,
        });

        const marker = new google.maps.Marker({
            position: location,
            map: map,
        });
    }
</script>

<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDp8G6b5r44YMZh-bO7VXEnxDB81Y1S-Go&callback=initMap">
</script>
