import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_map/app_constants.dart';
// import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:riverpod_map/provider/location_provider.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';

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
              urlTemplate: Mapbox.urlTemplate.value,
              fallbackUrl: Mapbox.urlTemplate.value,
              additionalOptions: {
                'username': Mapbox.mapboxUsername.value,
                'id': Mapbox.mapboxCustomStyle.value,
                'tilesize': Mapbox.tilesize256.value,
                'accessToken': mapboxAccessToken!,
              },
              maxNativeZoom: 19,
              ),
              CurrentLocationLayer(),
              MarkerLayer(
                markers: [
                  // Marker(point: latLng,
                  //     width: 80,
                  //     height: 80,
                  //     child: const Icon(Icons.circle, color: Colors.blue)),
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: const LatLng(20.971889, 105.758536),
                    child: IconButton(
                      icon: const Icon(Icons.location_on),
                      color: Colors.blue,
                      onPressed: () async {
                        setState(() {
                          latLng = const LatLng(20.971889, 105.758536);
                          controller.move(latLng, controller.camera.zoom);
                        });
                      },
                    ),
                  ),
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: const LatLng(21.027855,105.852349),
                    child: IconButton(
                      icon: const Icon(Icons.location_on),
                      color: Colors.blue,
                      onPressed: () async {
                        setState(() {
                          latLng = const LatLng(21.027855,105.852349);
                          controller.move(latLng, controller.camera.zoom);
                        });
                      },
                    ),
                  ),
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: const LatLng(21.046022,105.836376),
                    child: IconButton(
                      icon: const Icon(Icons.location_on),
                      color: Colors.blue,
                      onPressed: () async {
                        setState(() {
                          latLng = const LatLng(21.046022,105.836376);
                          controller.move(latLng, controller.camera.zoom);
                        });
                      },
                    ),
                  ),
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: const LatLng(20.982172,105.770871),
                    child: IconButton(
                      icon: const Icon(Icons.location_on),
                      color: Colors.blue,
                      onPressed: () async {
                        setState(() {
                          latLng = const LatLng(20.982172,105.770871);
                          controller.move(latLng, controller.camera.zoom);
                        });
                      },
                    ),
                  ),
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: const LatLng(20.974474,105.758380),
                    child: IconButton(
                      icon: const Icon(Icons.location_on),
                      color: Colors.blue,
                      onPressed: () async {
                        setState(() {
                          latLng = const LatLng(20.974474,105.758380);
                          controller.move(latLng, controller.camera.zoom);
                        });
                      },
                    ),
                  ),
                ],
              ),
          ]),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              scrollDirection: Axis.horizontal,
              children: [
                ElevatedButton(
                  child: const Text('Nam Cuong building'),
                  onPressed: () async {
                    setState(() {
                      latLng = const LatLng(20.974474,105.758380);
                      controller.move(latLng, controller.camera.zoom);
                    });
                  },
                ),
                SizedBox.fromSize(size: const Size(10, 10)),
                ElevatedButton(
                  child: const Text('Cong ty'),
                  onPressed: () async {
                    setState(() {
                      latLng = const LatLng(20.982172,105.770871);
                      controller.move(latLng, controller.camera.zoom);
                    });
                  },
                ),
                SizedBox.fromSize(size: const Size(10, 10)),
                ElevatedButton(
                  child: const Text('Ho Tay'),
                  onPressed: () async {
                    setState(() {
                      latLng = const LatLng(21.046022,105.836376);
                      controller.move(latLng, controller.camera.zoom);
                    });
                  },
                ),
                SizedBox.fromSize(size: const Size(10, 10)),
                ElevatedButton(
                  child: const Text('Thap rua'),
                  onPressed: () async {
                    setState(() {
                      latLng = const LatLng(21.027855,105.852349);
                      controller.move(latLng, controller.camera.zoom);
                    });
                  },
                ),
              ],
            ),
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
