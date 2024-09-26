import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class DeliveryTrackingScreen extends StatefulWidget {
  @override
  _DeliveryTrackingScreenState createState() => _DeliveryTrackingScreenState();
}

class _DeliveryTrackingScreenState extends State<DeliveryTrackingScreen> {
  GoogleMapController? mapController;

  final LatLng _initialPosition = LatLng(37.7749, -122.4194);
  final LatLng _courierPosition = LatLng(37.7799, -122.4294);
  final LatLng _destinationPosition = LatLng(37.7699, -122.4194);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.settings),
          Gap(20)
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _initialPosition,
              zoom: 14.0,
            ),
            markers: {
              Marker(
                markerId: MarkerId('courier'),
                position: _courierPosition,
              ),
              Marker(
                markerId: MarkerId('destination'),
                position: _destinationPosition,
              ),
            },
            onMapCreated: (controller) {
              setState(() {
                mapController = controller;
              });
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '10 minutes left',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text('Delivery to Jl. Kpg Sutoyo'),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.green),
                    title: Text('Delivered your order'),
                    subtitle: Text(
                        'We will deliver your goods to you in the shortest possible time.'),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://via.placeholder.com/150'), // Placeholder image
                    ),
                    title: Text('Brooklyn Simmons'),
                    subtitle: Text('Personal Courier'),
                    trailing: IconButton(
                      icon: Icon(Icons.phone),
                      onPressed: () {
                        // Add call functionality here
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
