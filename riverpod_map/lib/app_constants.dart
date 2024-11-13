import 'package:flutter_dotenv/flutter_dotenv.dart';

String? mapboxAccessToken = dotenv.env['ACCESS_TOKEN'];

enum Mapbox {
  mapboxUsername,
  mapboxCustomStyle,
  testUsername,
  urlTemplate,
  standardStyle,
  standardSatelliteStyle,
  streetsStyle,
  outdoorsStyle,
  lightStyle,
  darkStyle,
  satelliteStyle,
  satelliteStreetsStyle,
  navigationDayStyle,
  navigationNightStyle,
  tilesize256
}

extension MapboxExtension on Mapbox {
  String get value {
    switch (this) {
      case Mapbox.mapboxUsername:
        return 'hoanghn190603';
      case Mapbox.mapboxCustomStyle:
        return 'cm3105fgb00ut01pk1myd0hme';
      case Mapbox.testUsername:
        return 'mapbox';
      case Mapbox.urlTemplate:
        // return 'https://api.mapbox.com/v4/{id}/{z}/{x}/{y}@2x.png?access_token=$mapboxAccessToken';
        return 'https://api.mapbox.com/styles/v1/{username}/{id}/tiles/{tilesize}/{z}/{x}/{y}@2x?access_token={accessToken}';
      case Mapbox.standardStyle:
        return 'mapbox://styles/mapbox/standard';
      case Mapbox.standardSatelliteStyle:
        return 'mapbox://styles/mapbox/standard-satellite';
      case Mapbox.streetsStyle:
        return 'mapbox://styles/mapbox/streets-v12';
      case Mapbox.outdoorsStyle:
        return 'mapbox://styles/mapbox/outdoors-v12';
      case Mapbox.lightStyle:
        return 'mapbox://styles/mapbox/light-v11';
      case Mapbox.darkStyle:
        return 'mapbox://styles/mapbox/dark-v11';
      case Mapbox.satelliteStyle:
        return 'mapbox://styles/mapbox/satellite-v9';
      case Mapbox.satelliteStreetsStyle:
        return 'mapbox://styles/mapbox/satellite-streets-v12';
      case Mapbox.navigationDayStyle:
        return 'mapbox://styles/mapbox/navigation-day-v1';
      case Mapbox.navigationNightStyle:
        return 'navigation-night-v1';
      case Mapbox.tilesize256:
        return '256';
    }
  }
}
