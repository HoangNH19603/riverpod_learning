import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Mapbox {
  // ${dotenv.env['ACCESS_TOKEN']}
  urlTemplate(value: 'https://api.mapbox.com/styles/v1/hoanghn190603/clzrta6wf007601qu2ce63xo8/tiles/256/{z}/{x}/{y}@2x?access_token='),
  standardStyle(value: 'mapbox://styles/mapbox/standard'),
  standardSatelliteStyle(value: 'mapbox://styles/mapbox/standard-satellite'),
  streetsStyle(value: 'mapbox://styles/mapbox/streets-v12'),
  outdoorsStyle(value: 'mapbox://styles/mapbox/outdoors-v12'),
  lightStyle(value: 'mapbox://styles/mapbox/light-v11'),
  darkStyle(value: 'mapbox://styles/mapbox/dark-v11'),
  satelliteStyle(value: 'mapbox://styles/mapbox/satellite-v9'),
  satelliteStreetsStyle(value: 'mapbox://styles/mapbox/satellite-streets-v12'),
  navigationDayStyle(value: 'mapbox://styles/mapbox/navigation-day-v1'),
  navigationNightStyle(value: 'mapbox://styles/mapbox/navigation-night-v1');

  final String value;

  const Mapbox({required this.value});

  // add getters
  String get urlTemplate => value;
  String get standardStyle => value;
  String get standardSatelliteStyle => value;
  String get streetsStyle => value;
  String get outdoorsStyle => value;
  String get lightStyle => value;
  String get darkStyle => value;
  String get satelliteStyle => value;
  String get satelliteStreetsStyle => value;
  String get navigationDayStyle => value;
  String get navigationNightStyle => value;
}