import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:riverpod_map/app_constants.dart';

class PolylineScreen extends StatelessWidget {
  const PolylineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Polyline maker Screen'),),
      body: FlutterMap(
        children: [
          TileLayer(
            urlTemplate: Mapbox.urlTemplate,
          )
        ]
        ),
    );
  }
}