import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationSample extends StatefulWidget{
  @override
  _LocationSampleState createState() => _LocationSampleState();
}

class _LocationSampleState extends State<LocationSample> {
  // Location
  Position position; // Geolocator

  @override
  void initState() {
    super.initState();
    _getLocation(context);
  }

  Future<void> _getLocation(context) async {
    Position _currentPosition = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(_currentPosition);
    setState(() {
      position = _currentPosition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GeolocationStatus>(
      future: Geolocator().checkGeolocationPermissionStatus(),
      builder: 
          (BuildContext context, AsyncSnapshot<GeolocationStatus> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.data == GeolocationStatus.denied) {
          return Text(
            'Access to location denied',
            textAlign: TextAlign.center,
          );
        }

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Location Infomation",
                style: TextStyle(
                  fontSize: 20.0
                ),
              ),
              Text("Your Current Location is :"),
              Text("${position}")
            ],
          ),
        );
      }
    );
  }
}