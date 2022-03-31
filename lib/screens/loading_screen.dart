import 'package:clima_flutter_stub/screens/location_screen.dart';
import 'package:clima_flutter_stub/services/location.dart';
import 'package:clima_flutter_stub/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getCurrentWeatherData() async {
    LocationHelper locationHelper = LocationHelper();
    await locationHelper.getCurrentLocation();

    ApiHelper apiHelper = ApiHelper();
    var weatherData =
        await apiHelper.getWeatherDataWithLocation(
          lat: locationHelper.latitude,
          lon: locationHelper.longitude,
        );
    // print(weatherData);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return LocationScreen(weatherData: weatherData);
      }),
    );
  }


  @override
  void initState() {
    super.initState();
    getCurrentWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 70.0,
        ),
      ),
    );
  }
}