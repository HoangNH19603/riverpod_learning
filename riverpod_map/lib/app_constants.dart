enum Mapbox {
  uri(path: 'api.mapbox.com'),
  standardStyle(path: 'mapbox://styles/mapbox/standard'),
  standardSatelliteStyle(path: 'mapbox://styles/mapbox/standard-satellite'),
  streetsStyle(path: 'mapbox://styles/mapbox/streets-v12'),
  outdoorsStyle(path: 'mapbox://styles/mapbox/outdoors-v12'),
  lightStyle(path: 'mapbox://styles/mapbox/light-v11'),
  darkStyle(path: 'mapbox://styles/mapbox/dark-v11'),
  satelliteStyle(path: 'mapbox://styles/mapbox/satellite-v9'),
  satelliteStreetsStyle(path: 'mapbox://styles/mapbox/satellite-streets-v12'),
  navigationDayStyle(path: 'mapbox://styles/mapbox/navigation-day-v1'),
  navigationNightStyle(path: 'mapbox://styles/mapbox/navigation-night-v1');

  final String path;

  const Mapbox({required this.path});
}