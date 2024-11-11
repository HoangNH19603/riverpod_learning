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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapbox'),
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: controller,
            options: MapOptions(
                initialCenter: latLng,
                initialZoom: 20,
                minZoom: 5,
                maxZoom: 22,
                onMapReady: () {
                  controller.mapEventStream.listen((event) {});
                }),
          children: [
            TileLayer(
              tileProvider: CancellableNetworkTileProvider(),
              // tileProvider: NetworkTileProvider(),
              // urlTemplate: 'https://api.mapbox.com/styles/v1/{username}/cm3105fgb00ut01pk1myd0hme/tiles/{tilesize}/{z}/{x}/{y}@2x?access_token={accessToken}',
              urlTemplate: 'https://api.mapbox.com/styles/v1/{username}/{id}/tiles/{tilesize}/{z}/{x}/{y}@2x?access_token={accessToken}',
              // urlTemplate: 'https://api.mapbox.com/styles/v1/{username}/{id}/tiles/{tilesize}/{z}/{x}/{y}@2x?access_token={accessToken}',
              // urlTemplate: Mapbox.urlTemplate.value,
              // fallbackUrl: Mapbox.urlTemplate.value,
              additionalOptions: {
                'username': 'mapbox',
                'id': 'navigation-night-v1',
                // 'username': 'hoanghn190603',
                // 'id': 'cm3105fgb00ut01pk1myd0hme',
                'tilesize': '256',
                'accessToken': mapboxAccessToken!,
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
                      Icons.circle,
                      color: Colors.blue,
                      fill: 1,
                    ),
                  ),
                ],
              ),
          ]),
          GestureDetector(
            child: SizedBox.fromSize(
              size: const Size(50, 50),
              child: const Icon(
                Icons.my_location,
                color: Colors.red,
              ),
            ),
            onTap: () async {
              var position = await determinePosition();
              setState(() {
                latLng = LatLng(position.latitude, position.longitude);
                controller.move(latLng, controller.camera.zoom);
              });
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () async {
          var position = await determinePosition();
          setState(() {
            latLng = LatLng(position.latitude, position.longitude);
            controller.move(latLng, controller.camera.zoom);
          });
        },
        child: const Icon(Icons.my_location),
      ),
    );
  }
}
