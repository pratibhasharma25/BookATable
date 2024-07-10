// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:geolocator/geolocator.dart';

// class MapPage extends StatefulWidget {
//   @override
//   _MapPageState createState() => _MapPageState();
// }

// class _MapPageState extends State<MapPage> {
//   Position? _currentPosition;
//   List<Restaurant> _restaurants = [];

//   @override
//   void initState() {
//     super.initState();
//     _loadMapData();
//   }

//   Future<void> _loadMapData() async {
//     _currentPosition = await _getCurrentLocation();
//     if (_currentPosition != null) {
//       _restaurants = await fetchNearbyRestaurants(_currentPosition!.latitude, _currentPosition!.longitude);
//       setState(() {});
//     }
//   }

//   Future<Position> _getCurrentLocation() async {
//     return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Nearby Restaurants')),
//       body: _currentPosition == null
//           ? Center(child: CircularProgressIndicator())
//           : FlutterMap(
//               options: MapOptions(
//                 center: LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
//                 zoom: 13.0,
//               ),
//               layers: [
//                 TileLayerOptions(
//                   urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
//                   subdomains: ['a', 'b', 'c'],
//                 ),
//                 MarkerLayerOptions(
//                   markers: [
//                     Marker(
//                       width: 80.0,
//                       height: 80.0,
//                       point: LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
//                       builder: (ctx) => Container(
//                         child: Icon(
//                           Icons.my_location,
//                           color: Colors.blue,
//                           size: 40.0,
//                         ),
//                       ),
//                     ),
//                     ..._restaurants.map((restaurant) {
//                       return Marker(
//                         width: 80.0,
//                         height: 80.0,
//                         point: LatLng(restaurant.lat, restaurant.lon),
//                         builder: (ctx) => Container(
//                           child: Icon(
//                             Icons.location_on,
//                             color: Colors.red,
//                             size: 40.0,
//                           ),
//                         ),
//                       );
//                     }).toList(),
//                   ],
//                 ),
//               ],
//             ),
//     );
//   }
// }
