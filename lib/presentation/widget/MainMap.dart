import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_charge/core/geoIconGenerator/geo_ison_generator.dart';
import 'package:get_charge/presentation/widget/buttons/AppBarButton.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MainMap extends StatefulWidget {
  const MainMap({Key? key}) : super(key: key);

  @override
  State<MainMap> createState() => _MainMapState();
}

class _MainMapState extends State<MainMap> {
  final double zoomMove = 1;
  final double initZoom = 19;
  bool userStartedUsing = false;
  Timer? zoomTimer;
  GoogleMapController? _mapController;
  Set<Marker> markers = {};

  _zoomMap(bool decrease) async {
    _mapController?.animateCamera(
      decrease ? CameraUpdate.zoomIn() : CameraUpdate.zoomOut(),
    );
  }

  _setInitialLocation(bool isInit) async {
    Position currentPosition = await Geolocator.getCurrentPosition();
    if (isInit && userStartedUsing) return;
    CameraPosition cPosition = CameraPosition(
      zoom: initZoom,
      target: LatLng(currentPosition.latitude, currentPosition.longitude),
    );
    _mapController?.animateCamera(CameraUpdate.newCameraPosition(cPosition)).then((value) => setState(() {}));
  }

  void addMarkers({required MarkerId markerId, required LatLng latLng}) async {
    markers.add(Marker(
      markerId: markerId,
      position: latLng,
      icon: BitmapDescriptor.fromBytes(await GeoIconGenerator.getImageBytes(1)),
    ));
    setState(() {});
  }

  @override
  void initState() {
    addMarkers(markerId: MarkerId('test'), latLng: LatLng(0, 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        GoogleMap(
          initialCameraPosition: const CameraPosition(target: LatLng(0, 0), zoom: 5),
          zoomControlsEnabled: false,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          markers: markers,
          mapToolbarEnabled: false,
          onTap: (_) => userStartedUsing = true,
          onMapCreated: (GoogleMapController controller) {
            _mapController = controller;
            // _setInitialLocation(true);
          },
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 212),
          padding: const EdgeInsets.symmetric(horizontal: 30),
          height: 173,
          child: Column(
            children: [
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppBarButton(
                        icon: const Icon(Icons.add, color: Color.fromRGBO(0, 158, 240, 1), size: 28),
                        onPressed: () => _zoomMap(true),
                        onTapDown: (tap) {
                          _zoomMap(true);
                          zoomTimer = Timer.periodic(const Duration(milliseconds: 250), (timer) {
                            _zoomMap(true);
                          });
                        },
                        onTapUp: (tap) => zoomTimer?.cancel(),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 16)),
                      AppBarButton(
                        icon: const Icon(Icons.remove, color: Color.fromRGBO(0, 158, 240, 1), size: 28),
                        onPressed: () => _zoomMap(false),
                        onTapDown: (tap) {
                          _zoomMap(false);
                          zoomTimer = Timer.periodic(const Duration(milliseconds: 250), (timer) {
                            _zoomMap(false);
                          });
                        },
                        onTapUp: (tap) => zoomTimer?.cancel(),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppBarButton(
                        icon: SvgPicture.asset('images/location_arrow.svg'),
                        onPressed: () => _setInitialLocation(false),
                      ),
                    ],
                  )
                ],
              )),
            ],
          ),
        ),
      ],
    );
  }
}

// TextButton(
// onPressed: () => Helpers.openModal(
// context, const TerminalInfo(terminalOpen: true)),
// child: const Text(
// 'Точка открыта',
// style: TextStyle(color: Colors.red),
// )),
// TextButton(
// onPressed: () => Helpers.openModal(
// context, const TerminalInfo(terminalOpen: false)),
// child: const Text(
// 'Точка закрыта',
// style: TextStyle(color: Colors.red),
// ))
