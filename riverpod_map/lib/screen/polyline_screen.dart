import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
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
    LatLng latLng = const LatLng(20.971889, 105.758536);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapbox'),
      ),
      body: FlutterMap(options: MapOptions(initialCenter: latLng, initialZoom: 20, minZoom: 5, maxZoom: 22), children: [
        TileLayer(
          // tileProvider: CancellableNetworkTileProvider(),
          tileProvider: NetworkTileProvider(),
          // urlTemplate: Mapbox.urlTemplate.value,
          urlTemplate: 'https://api.mapbox.com/v4/{id}/{z}/{x}/{y}@2x.png?access_token=$mapboxAccessToken',
          fallbackUrl: 'https://api.mapbox.com/v4/{id}/{z}/{x}/{y}@2x.png?access_token=$mapboxAccessToken',
          // urlTemplate: 'https://api.mapbox.com/styles/v1/hoanghn190603/clzup26h600jq01qx4pzi5yub/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiaG9hbmdobjE5MDYwMyIsImEiOiJjbHp1cGV3ajEwOHIyMmlzOTJnZzJrc3lpIn0.5-ImdoXACPeUizQbk87PZg',
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
                child: const Icon(Icons.location_on, color: Colors.amber,),
              ),
            ],
          ),
      ]),
      floatingActionButton: FloatingActionButton.small(onPressed: () async {
        var position = await determinePosition();
        setState(() {
          latLng = LatLng(position.latitude, position.longitude);
        });
      },
      child: const Icon(Icons.my_location),),
    );
  }
}
