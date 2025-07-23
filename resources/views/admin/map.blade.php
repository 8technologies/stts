<!-- Leaflet CSS -->
<link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />

<!-- Leaflet JS -->
<!-- Leaflet CSS -->
<link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
<script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>

<div class="map-container">
    <h3>{{ $title ?? 'Location Map' }}</h3>
    <div id="map-{{ $title }}" style="height: 400px;"></div>
</div>

<script>
    function loadLeafletMap_{{ \Str::slug($title ?? 'map') }}() {
        var lat = {{ $latitude }};
        var lng = {{ $longitude }};
        var mapId = 'map-{{ $title }}';

        var map = L.map(mapId).setView([lat, lng], 13);

        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '© OpenStreetMap contributors'
        }).addTo(map);

        L.marker([lat, lng]).addTo(map)
            .bindPopup('{{ $title ?? 'Location' }}')
            .openPopup();

        setTimeout(() => map.invalidateSize(), 300);
    }

    $(document).off('pjax:complete.{{ \Str::slug($title ?? 'map') }}')
        .on('pjax:complete.{{ \Str::slug($title ?? 'map') }}', function () {
            loadLeafletMap_{{ \Str::slug($title ?? 'map') }}();
        });

    $(document).ready(function () {
        loadLeafletMap_{{ \Str::slug($title ?? 'map') }}();
    });
</script>

 {{-- <div id="map" style="height: 400px; width: 100%;"></div>

 <script>
    document.addEventListener("DOMContentLoaded", function () {
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
    });
</script>

<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDp8G6b5r44YMZh-bO7VXEnxDB81Y1S-Go&callback=initMap">
</script>
 --}}