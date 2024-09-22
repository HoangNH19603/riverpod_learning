import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_map/app_constants.dart';
// import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:riverpod_map/provider/location_provider.dart';

class PolylineScreen extends StatefulWidget {
  const PolylineScreen({super.key});

  @override
  State<PolylineScreen> createState() => _PolylineScreenState();
}

class _PolylineScreenState extends State<PolylineScreen> {
  final MapController controller = MapController();
  LatLng latLng = const LatLng(20.971889, 105.758536);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapbox'),
      ),
      body: FlutterMap(
        mapController: controller,
        options: MapOptions(initialCenter: latLng, initialZoom: 20, minZoom: 5, maxZoom: 22),
        children: [
        TileLayer(
          tileProvider: CancellableNetworkTileProvider(),
          // tileProvider: NetworkTileProvider(),
          urlTemplate: Mapbox.urlTemplate.value,
          fallbackUrl: Mapbox.urlTemplate.value,
          additionalOptions: {
            'accessToken': mapboxAccessToken!,
            'id': 'mapbox.mapbox-streets-v8',
          },
          maxNativeZoom: 19,
        ),
        MarkerLayer(
          markers: [
            Marker(
              width: 80.0,
              height: 80.0,
              point: latLng,
              child: const Icon(
                Icons.location_on,
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
      ]),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () async {
          var position = await determinePosition();
          setState(() {
            latLng = LatLng(position.latitude, position.longitude);
          });
        },
        child: const Icon(Icons.my_location),
      ),
    );
  }
}
