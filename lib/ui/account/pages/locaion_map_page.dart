import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

// import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sel_org/core/router/app_router.dart';
import 'package:sel_org/ui/account/model/address_model.dart';

import '../../../core/di/injector.dart';
import '../../../core/utils/dimens.dart';
import '../../widgets/buttons.dart';
import '../bloc/cubit/faq_cubit.dart';

@RoutePage()
class LocationMapScreen extends StatelessWidget {
  const LocationMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => getIt<FaqCubit>(), child: const LocationMapContent());
  }
}

class LocationMapContent extends StatefulWidget {
  const LocationMapContent({super.key});

  @override
  State<StatefulWidget> createState() => _LocationMapContent();
}

class _LocationMapContent extends State<LocationMapContent> {
  final Location location = Location();
  final Map<String, Marker> _markers = {};
  String locationInfo =
      "Please tap on the map to select your location to continue.";
  GoogleMapController? controller;
  double? latitude;
  double? longitude;

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(overlayStyle);
    });
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    this.controller = controller;
    if (_permissionGranted != PermissionStatus.granted) {
      _requestPermission();
    } else {
      LocationData locationData = await location.getLocation();
      controller.animateCamera(CameraUpdate.newLatLng(
          LatLng(locationData.latitude ?? 0.0, locationData.longitude ?? 0.0)));
      // setState(() {
      //   _markers['location'] = Marker(
      //       markerId: MarkerId("location"),
      //       position: LatLng(locationData.latitude ?? 0.0, locationData.longitude ?? 0.0),
      //       icon: BitmapDescriptor.defaultMarker);
      // });
    }
  }

  PermissionStatus? _permissionGranted;

  Future<void> _checkPermissions() async {
    final permissionGrantedResult = await location.hasPermission();
    setState(() {
      _permissionGranted = permissionGrantedResult;
    });
  }

  Future<void> _requestPermission() async {
    if (_permissionGranted != PermissionStatus.granted) {
      final permissionRequestedResult = await location.requestPermission();
      setState(() {
        _permissionGranted = permissionRequestedResult;
      });
      if (permissionRequestedResult == PermissionStatus.granted) {
        LocationData locationData = await location.getLocation();
        controller?.animateCamera(CameraUpdate.newLatLng(LatLng(
            locationData.latitude ?? 0.0, locationData.longitude ?? 0.0)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _checkPermissions();

    return Scaffold(
        appBar: AppBar(
          title: const Text("Choose location"),
          elevation: 4,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: const CameraPosition(
                    zoom: 18.0, target: LatLng(12.0234, 80.4355)),
                onTap: (argument) {
                  setState(() {
                    locationInfo = "";
                    _markers['location'] = Marker(
                        markerId: const MarkerId("location"),
                        position: LatLng(argument.latitude, argument.longitude),
                        icon: BitmapDescriptor.defaultMarker);
                    latitude = argument.latitude;
                    longitude = argument.longitude;
                  });
                },
                markers: _markers.values.toSet(),
                // myLocationEnabled: true,
                myLocationButtonEnabled: true,
              )),
              Column(
                children: [
                  const Gap(8.0),
                  Visibility(
                      visible: locationInfo.isNotEmpty,
                      child: Text(locationInfo)),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: NormalFilledButton("Next", () {
                      if (locationInfo.isEmpty) {
                        final address = AddressModel(
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            latitude.toString(),
                            longitude.toString(),
                            false,
                            false);
                        context.router
                            .popAndPush(AddAddressRoute(addressModel: address));
                      } else {}
                    }),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
