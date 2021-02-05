import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Harita extends StatelessWidget {
  Completer<GoogleMapController> _haritaAc = Completer<GoogleMapController>();
  Map<MarkerId, Marker> _isaretler = Map<MarkerId, Marker>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HARİTA',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 300.0,
            width: double.maxFinite,
            child: GoogleMap(
              markers: Set<Marker>.of(_isaretler.values),
              initialCameraPosition: CameraPosition(
                target: LatLng(40.5413, 29.2223),
                zoom: 17.0,
              ),
              onMapCreated: (controller) {
                _haritaAc.complete(controller);
                final MarkerId markerId = MarkerId('center');
                final Marker marker = Marker(
                  markerId: markerId,
                  position: LatLng(40.5413, 29.2223),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
