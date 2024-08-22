import 'package:flutter/material.dart';
import 'package:riverpod_map/screen/google_map_screen.dart';
import 'package:riverpod_map/screen/map_controller_screen.dart';
import 'package:riverpod_map/screen/mapbox_screen.dart';
import 'package:riverpod_map/screen/polyline_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Map Package'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const PolylineScreen()));
                },
                child: const Text('Polyline Markers Page')),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MapControllerScreen()));
                },
                child: const Text('Map Controller Page')),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MapboxScreen()));
                },
                child: const Text('Mapbox')),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const GoogleMapScreen()));
                },
                child: const Text('Google Map')),
          ],
        ),
      ),
    );
  }
}
