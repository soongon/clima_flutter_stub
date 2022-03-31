import 'package:clima_flutter_stub/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

//import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
    );
    print(position);
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {

            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const LocationScreen()),
            // );
          },
          child: const Text('Get Location'),
        ),
      ),
    );
  }
}