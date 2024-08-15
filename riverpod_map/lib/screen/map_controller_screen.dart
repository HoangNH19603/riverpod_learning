import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_map/app_constants.dart';

class MapControllerScreen extends StatelessWidget {
  const MapControllerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Map Controller Screen')),
      body: FlutterMap(
          options: const MapOptions(
            initialCenter: LatLng(51.509364, -0.128928), // Center the map over London
            initialZoom: 9.2,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              // additionalOptions: {
              //   'accessToken': mapboxAccessToken!,
              //   'id': 'mapbox.mapbox-streets-v8',
              // },
              maxNativeZoom: 19,
            ),
          ]),
    );
  }
}