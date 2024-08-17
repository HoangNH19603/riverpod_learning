import 'package:flutter_dotenv/flutter_dotenv.dart';

String? mapboxAccessToken = dotenv.env['ACCESS_TOKEN'];

enum Mapbox {
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
}

extension MapboxExtension on Mapbox {
  String get value {
    switch (this) {
      case Mapbox.urlTemplate:
        return 'https://api.mapbox.com/styles/v1/hoanghn190603/clzup26h600jq01qx4pzi5yub/tiles/256/{z}/{x}/{y}@2x?access_token=$mapboxAccessToken';
        // return 'https://api.mapbox.com/styles/v1/hoanghn190603/clzup26h600jq01qx4pzi5yub/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiaG9hbmdobjE5MDYwMyIsImEiOiJjbHp1cGV3ajEwOHIyMmlzOTJnZzJrc3lpIn0.5-ImdoXACPeUizQbk87PZg';
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
        return 'mapbox://styles/mapbox/navigation-night-v1';
    }
  }
}