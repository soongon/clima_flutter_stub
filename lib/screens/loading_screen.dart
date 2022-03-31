import 'package:clima_flutter_stub/screens/location_screen.dart';
import 'package:clima_flutter_stub/services/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

//import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getLocation() async {
    LocationHelper locationHelper = LocationHelper();
    await locationHelper.getCurrentLocation();
    double latitude = locationHelper.latitude;
    double longitude = locationHelper.longitude;

    print(latitude);
    print(longitude);

    // 1. 요청 주소를 만든다.
    // https://api.openweathermap.org/data/2.5/weather?lat=37&lon=127&appid=5df3f1b99c9227bb6bb15d61c2b5bf9b
    var url = Uri.https(
      'api.openweathermap.org',
      '/data/2.5/weather',
      {
        'lat': latitude.toString(),
        'lon': longitude.toString(),
        'appid': '5df3f1b99c9227bb6bb15d61c2b5bf9b',
      },
    );
    // 2. get 방식으로 요청을 보내고 응답을 받는다.
    Response response = await get(url);
    // 3. 응답 받은 결과를 JSON 포맷으로 변환한다.
    print(response.body);
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