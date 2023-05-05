import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:waaa/core/theme/colors.dart';

class ShowMaps extends StatelessWidget {
  const ShowMaps({super.key});

  @override
  Widget build(BuildContext context) {
    final parisLocation = LatLng(48.866667, 2.333333);
    final romeLocation = LatLng(41.902782, 12.496366);
    final istanbulLocation = LatLng(41.015137, 28.979530);

    final controller = MapController();
    final mapOptions = MapOptions(
      center: parisLocation,
      zoom: 3,
      enableScrollWheel: true,
    );

    return FlutterMap(
      mapController: controller,
      options: mapOptions,
      nonRotatedChildren: const [],
      children: [
        TileLayer(
          urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: parisLocation,
              width: 50,
              height: 50,
              builder: (context) => Center(
                child: IconButton(
                  onPressed: showMapPinDialog(),
                  icon: Icon(
                    FeatherIcons.xCircle,
                    color: grayColor,
                    size: 30,
                  ),
                ),
              ),
            ),
            Marker(
              point: romeLocation,
              width: 50,
              height: 50,
              builder: (context) => Center(
                child: IconButton(
                  onPressed: showMapPinDialog(),
                  icon: Icon(
                    FeatherIcons.xCircle,
                    color: grayColor,
                    size: 30,
                  ),
                ),
              ),
            ),
            Marker(
              point: istanbulLocation,
              width: 50,
              height: 50,
              builder: (context) => Center(
                child: IconButton(
                  onPressed: showMapPinDialog(),
                  icon: Icon(
                    FeatherIcons.xCircle,
                    color: grayColor,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

showMapPinDialog() {}
