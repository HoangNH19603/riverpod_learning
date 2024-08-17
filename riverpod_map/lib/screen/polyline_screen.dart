import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_map/app_constants.dart';

class PolylineScreen extends StatefulWidget {
  const PolylineScreen({super.key});

  @override
  State<PolylineScreen> createState() => _PolylineScreenState();
}

class _PolylineScreenState extends State<PolylineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapbox'),
      ),
      body: FlutterMap(
          options: const MapOptions(
            initialCenter: LatLng(51.509364, -0.128928), // Center the map over London
            initialZoom: 9,
            minZoom: 5,
            maxZoom: 22
          ),
          children: [
            TileLayer(
              urlTemplate: Mapbox.urlTemplate.value,
              additionalOptions: {
                // 'accessToken': mapboxAccessToken!,
                'id': 'mapbox.mapbox-streets-v8',
              },
              maxNativeZoom: 19,
            ),
          ]),
    );
  }
}
