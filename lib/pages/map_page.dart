import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../widgets/bottom_navbar.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  static const LatLng initialPosition = LatLng(
    -2.9761,
    104.7754,
  );

  final Set<Marker> markers = {
    Marker(
      markerId: const MarkerId('lokasi1'),
      position: const LatLng(-2.9761, 104.7754),
      infoWindow: const InfoWindow(
        title: 'Tempat Sampah 1',
        snippet: 'Tempat sampah umum',
      ),
    ),
    Marker(
      markerId: const MarkerId('lokasi2'),
      position: const LatLng(-2.9780, 104.7800),
      infoWindow: const InfoWindow(
        title: 'Tempat Sampah 2',
        snippet: 'Tempat sampah umum',
      ),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Peta Lokasi',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: initialPosition,
          zoom: 14,
        ),
        markers: markers,
        myLocationButtonEnabled: true,
        myLocationEnabled: false,
      ),

      bottomNavigationBar: const BottomNavbar(
        currentIndex: 1,
      ),
    );
  }
}