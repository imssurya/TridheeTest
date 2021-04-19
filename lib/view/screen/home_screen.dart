import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<GoogleMapController> _controller = Completer();
  // GoogleMapController mapController;

  static final CameraPosition _myLocation = CameraPosition(
    target: LatLng(10.903271493796296, 77.13151204107544),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'where do you want to park?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Container(
                height: MediaQuery.of(context).size.height - 50,
                child: Stack(
                  clipBehavior: Clip.hardEdge,
                  children: [
                    Center(
                      child: Container(
                        child: GoogleMap(
                            onMapCreated: (GoogleMapController controller) {
                              _controller.complete(controller);
                            },
                            initialCameraPosition: _myLocation),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      right: 10,
                      //width: MediaQuery.of(context).size.width - 90,
                      child: Container(
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Icon(Icons.menu),
                            ),
                            Container(width: 100, child: TextField()),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.search),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
