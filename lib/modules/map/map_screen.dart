import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rosheta_project/Bloc/Cubit/cubit.dart';
import 'package:rosheta_project/constant.dart';

import '../../Shared/variable.dart';

class GoogleMapScreen extends StatefulWidget {
  final double destLatitude;
  final double destLongitude;
   const GoogleMapScreen({Key? key,required this.destLatitude,required this.destLongitude}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState(destLatitude:  destLatitude,destLongitude: destLongitude);
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  final double destLatitude;
  final double destLongitude;
  List<LatLng> polyLineCoordinates = [];


  _GoogleMapScreenState({required this.destLatitude,required this.destLongitude});


  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleMapKey,
        PointLatLng(UserCubit.get(context).userModel!.latitude, UserCubit.get(context).userModel!.longitude),
        PointLatLng(destLatitude, destLongitude));

    if (result.points.isNotEmpty) {
      result.points.forEach(
        (PointLatLng point) => polyLineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      setState((){});
    }

  }

  @override
  initState() {
    getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pharmacy Location'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          bearing: 0.0,
          target: LatLng(UserCubit.get(context).userModel!.latitude, UserCubit.get(context).userModel!.longitude),
          tilt: 0.0,
          zoom: 17,
        ),
        markers: {
          Marker(
              markerId: const MarkerId('source'),
              position: LatLng(UserCubit.get(context).userModel!.latitude, UserCubit.get(context).userModel!.longitude)),
          Marker(
              markerId: const MarkerId('destination'),
              position: LatLng(destLatitude, destLongitude)),
        },
        polylines: {
          Polyline(
              polylineId: const PolylineId('route'),
              points:  polyLineCoordinates,
              color: Colors.blue,
              width: 6
          ),
        },
      ),
    );
  }
}

// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:material_floating_search_bar/material_floating_search_bar.dart';
//
// import 'package:uuid/uuid.dart';
// import '../../Bloc/map/map_cubit.dart';
// import '../../Bloc/map/map_states.dart';
// import '../../Models/place.dart';
// import '../../Models/place_directions.dart';
// import '../../Models/place_suggestion.dart';
// import '../../Shared/Components/colors.dart';
// import '../../Shared/Components/widgets/distance_and_time.dart';
// import '../../Shared/Components/widgets/place_item.dart';
// import '../../Shared/variable.dart';
// import '../../helper/location_hepler.dart';
//
// class MapScreen extends StatefulWidget {
//   const MapScreen({Key? key}) : super(key: key);
//
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }
//
// class _MapScreenState extends State<MapScreen> {
//   List<PlaceSuggestion> places = [];
//   Placemark? placemark;
//   FloatingSearchBarController controller = FloatingSearchBarController();
//
//   Completer<GoogleMapController> _mapController = Completer();
//
//   static final CameraPosition _myCurrentLocationCameraPosition = CameraPosition(
//     bearing: 0.0,
//     target: LatLng(position!.latitude, position!.longitude),
//     tilt: 0.0,
//     zoom: 17,
//   );
//
//   // these variables for getPlaceLocation
//   Set<Marker> markers = Set();
//   late PlaceSuggestion placeSuggestion;
//   late Place selectedPlace;
//   late Marker searchedPlaceMarker;
//   late Marker currentLocationMarker;
//   late CameraPosition goToSearchedForPlace;
//
//   void buildCameraNewPosition() {
//     goToSearchedForPlace = CameraPosition(
//       bearing: 0.0,
//       tilt: 0.0,
//       target: LatLng(
//         selectedPlace.result.geometry.location.lat,
//         selectedPlace.result.geometry.location.lng,
//       ),
//       zoom: 13,
//     );
//   }
//
//   // these variables for getDirections
//   PlaceDirections? placeDirections;
//   var progressIndicator = false;
//   late List<LatLng> polylinePoints;
//   var isSearchedPlaceMarkerClicked = false;
//   var isTimeAndDistanceVisible = false;
//   late String time;
//   late String distance;
//
//   @override
//   initState() {
//     super.initState();
//     getMyCurrentLocation();
//   }
//
//   Future<void> getMyCurrentLocation() async {
//     position = await LocationHelper.getCurrentLocation().whenComplete(() {
//       setState(() {});
//     });
//
//   }
//
//   Widget buildMap() {
//     return GoogleMap(
//       mapType: MapType.normal,
//       myLocationEnabled: true,
//       zoomControlsEnabled: false,
//       myLocationButtonEnabled: false,
//       markers: markers,
//       initialCameraPosition: _myCurrentLocationCameraPosition,
//       onMapCreated: (GoogleMapController controller) {
//         _mapController.complete(controller);
//       },
//       polylines: placeDirections != null
//           ? {
//         Polyline(
//           polylineId: const PolylineId('my_polyline'),
//           color: Colors.black,
//           width: 2,
//           points: polylinePoints,
//         ),
//       }
//           : {},
//     );
//   }
//
//
//
//   Future<void> _goToMyCurrentLocation() async {
//     final GoogleMapController controller = await _mapController.future;
//     controller.animateCamera(
//         CameraUpdate.newCameraPosition(_myCurrentLocationCameraPosition));
//
//     placeMarks = await placemarkFromCoordinates(position!.latitude,position!.longitude);
//     print('${placeMarks[0].subAdministrativeArea}');
//   }
//
//   Widget buildFloatingSearchBar() {
//     final isPortrait =
//         MediaQuery.of(context).orientation == Orientation.portrait;
//
//     return FloatingSearchBar(
//       controller: controller,
//       elevation: 6,
//       hintStyle: const TextStyle(fontSize: 18),
//       queryStyle: const TextStyle(fontSize: 18),
//       hint: 'Find a place..',
//       border: const BorderSide(style: BorderStyle.none),
//       margins: const EdgeInsets.fromLTRB(20, 70, 20, 0),
//       padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
//       height: 52,
//       iconColor: MyColors.blue,
//       scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
//       transitionDuration: const Duration(milliseconds: 600),
//       transitionCurve: Curves.easeInOut,
//       physics: const BouncingScrollPhysics(),
//       axisAlignment: isPortrait ? 0.0 : -1.0,
//       openAxisAlignment: 0.0,
//       width: isPortrait ? 600 : 500,
//       debounceDelay: const Duration(milliseconds: 500),
//       progress: progressIndicator,
//       onQueryChanged: (query) {
//         getPlacesSuggestions(query);
//       },
//       onFocusChanged: (_) {
//         // hide distance and time row
//         setState(() {
//           isTimeAndDistanceVisible = false;
//         });
//       },
//       transition: CircularFloatingSearchBarTransition(),
//       actions: [
//         FloatingSearchBarAction(
//           showIfOpened: false,
//           child: CircularButton(
//               icon: Icon(Icons.place, color: Colors.black.withOpacity(0.6)),
//               onPressed: () {}),
//         ),
//       ],
//       builder: (context, transition) {
//         return ClipRRect(
//           borderRadius: BorderRadius.circular(8),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               buildSuggestionsBloc(),
//               buildSelectedPlaceLocationBloc(),
//               buildDiretionsBloc(),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   Widget buildDiretionsBloc() {
//     return BlocListener<MapsCubit, MapsState>(
//       listener: (context, state) {
//         if (state is DirectionsLoaded) {
//           placeDirections = (state).placeDirections;
//
//           getPolylinePoints();
//         }
//       },
//       child: Container(),
//     );
//   }
//
//   void getPolylinePoints() {
//     polylinePoints = placeDirections!.polylinePoints
//         .map((e) => LatLng(e.latitude, e.longitude))
//         .toList();
//   }
//
//   Widget buildSelectedPlaceLocationBloc() {
//     return BlocListener<MapsCubit, MapsState>(
//       listener: (context, state) {
//         if (state is PlaceLocationLoaded) {
//           selectedPlace = (state).place;
//
//           goToMySearchedForLocation();
//           getDirections();
//         }
//       },
//       child: Container(),
//     );
//   }
//
//   void getDirections() {
//     BlocProvider.of<MapsCubit>(context).emitPlaceDirections(
//       LatLng(position!.latitude, position!.longitude),
//       LatLng(selectedPlace.result.geometry.location.lat,
//           selectedPlace.result.geometry.location.lng),
//     );
//   }
//
//   Future<void> goToMySearchedForLocation() async {
//     buildCameraNewPosition();
//     final GoogleMapController controller = await _mapController.future;
//     controller
//         .animateCamera(CameraUpdate.newCameraPosition(goToSearchedForPlace));
//     buildSearchedPlaceMarker();
//   }
//
//   void buildSearchedPlaceMarker() {
//     searchedPlaceMarker = Marker(
//       position: goToSearchedForPlace.target,
//       markerId: const MarkerId('1'),
//       onTap: () {
//         buildCurrentLocationMarker();
//         // show time and distance
//         setState(() {
//           isSearchedPlaceMarkerClicked = true;
//           isTimeAndDistanceVisible = true;
//         });
//       },
//       infoWindow: InfoWindow(title: placeSuggestion.description),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
//     );
//
//     addMarkerToMarkersAndUpdateUI(searchedPlaceMarker);
//   }
//
//   void buildCurrentLocationMarker() {
//     currentLocationMarker = Marker(
//       position: LatLng(position!.latitude, position!.longitude),
//       markerId: const MarkerId('2'),
//       onTap: () {},
//       infoWindow: const InfoWindow(title: "Your current Location"),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
//     );
//     addMarkerToMarkersAndUpdateUI(currentLocationMarker);
//   }
//
//   void addMarkerToMarkersAndUpdateUI(Marker marker) {
//     setState(() {
//       markers.add(marker);
//     });
//   }
//
//   void getPlacesSuggestions(String query) {
//     final sessionToken = const Uuid().v4();
//     BlocProvider.of<MapsCubit>(context)
//         .emitPlaceSuggestions(query, sessionToken);
//   }
//
//   Widget buildSuggestionsBloc() {
//     return BlocBuilder<MapsCubit, MapsState>(
//       builder: (context, state) {
//         if (state is PlacesLoaded) {
//           places = (state).places;
//           if (places.isNotEmpty) {
//             return buildPlacesList();
//           } else {
//             return Container();
//           }
//         } else {
//           return Container();
//         }
//       },
//     );
//   }
//
//   Widget buildPlacesList() {
//     return ListView.builder(
//         itemBuilder: (ctx, index) {
//           return InkWell(
//             onTap: () async {
//               placeSuggestion = places[index];
//               controller.close();
//               getSelectedPlaceLocation();
//               polylinePoints.clear();
//               removeAllMarkersAndUpdateUI();
//             },
//             child: PlaceItem(
//               suggestion: places[index],
//             ),
//           );
//         },
//         itemCount: places.length,
//         shrinkWrap: true,
//         physics: const ClampingScrollPhysics());
//   }
//
//   void removeAllMarkersAndUpdateUI() {
//     setState(() {
//       markers.clear();
//     });
//   }
//
//   void getSelectedPlaceLocation() {
//     final sessionToken = const Uuid().v4();
//     BlocProvider.of<MapsCubit>(context)
//         .emitPlaceLocation(placeSuggestion.placeId, sessionToken);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           position != null
//               ? buildMap()
//               : const Center(
//             child: CircularProgressIndicator(
//               color: MyColors.blue,
//             ),
//           ),
//           buildFloatingSearchBar(),
//           isSearchedPlaceMarkerClicked
//               ? DistanceAndTime(
//             isTimeAndDistanceVisible: isTimeAndDistanceVisible,
//             placeDirections: placeDirections,
//           )
//               : Container(),
//         ],
//       ),
//       floatingActionButton: Container(
//         margin: const EdgeInsets.fromLTRB(0, 0, 8, 30),
//         child: FloatingActionButton(
//           backgroundColor: MyColors.blue,
//           onPressed: _goToMyCurrentLocation,
//           child: const Icon(Icons.place, color: Colors.white),
//         ),
//       ),
//     );
//   }
// }
