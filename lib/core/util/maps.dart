import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class ShowMaps extends StatelessWidget {
  const ShowMaps({super.key});

  @override
  Widget build(BuildContext context) {
    final parisLocation = LatLng(48.866667, 2.333333);

    final controller = MapController();
    final mapOptions = MapOptions(
      center: parisLocation,
      zoom: 10,
      enableScrollWheel: true,
    );

    return FlutterMap(
      mapController: controller,
      options: mapOptions,
      nonRotatedChildren: [
        TileLayer(
          urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          userAgentPackageName: 'dev.fleaflet.flutter_map.example',
        ),
      ],
      children: const [],
    );
  }
}
