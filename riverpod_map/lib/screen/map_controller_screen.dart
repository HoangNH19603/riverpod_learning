import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapControllerScreen extends StatefulWidget {
  const MapControllerScreen({super.key});

  @override
  State<MapControllerScreen> createState() => _MapControllerScreenState();
}

class _MapControllerScreenState extends State<MapControllerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Openstreetmap')),
      body: FlutterMap(
          options: const MapOptions(
            initialCenter: LatLng(51.509364, -0.128928), // Center the map over London
            initialZoom: 9,
            minZoom: 5,
            maxZoom: 22,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              maxNativeZoom: 19,
            ),
          ]),
    );
  }
}