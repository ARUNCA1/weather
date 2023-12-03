import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/global/variables.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = Set<Marker>();
  static LatLng _center =
      LatLng(GlobalVariablesState.lat!, GlobalVariablesState.lon!);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _setMarker(LatLng point) {
    setState(() {
      _markers.add(
        Marker(
            markerId: const MarkerId('you are here'),
            position: point,
            infoWindow: const InfoWindow(title: "you are here")),
      );
    });
  }

  @override
  void initState() {
    super.initState();

    _setMarker(_center);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          onMapCreated: _onMapCreated,
          markers: _markers,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 17.0,
          ),
        ),
      ],
    );
  }
}
