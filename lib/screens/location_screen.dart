import 'package:clima_flutter_stub/screens/city_screen.dart';
import 'package:clima_flutter_stub/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima_flutter_stub/utilities/constants.dart';

class LocationScreen extends StatefulWidget {

  late var weatherData;

  LocationScreen({Key? key, this.weatherData}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  WeatherModel model = WeatherModel();

  late int temperature;
  late String conditionIcon;
  late String message;

  void updateUi({required weatherData}) {

    setState(() {
      temperature = weatherData['main']['temp'].toInt();
      conditionIcon = model.getWeatherIcon(weatherData['weather'][0]['id']);
      message = '${model.getMessage(temperature)} in ${weatherData['name']}!';
    });
  }

  @override
  void initState() {
    super.initState();
    var weatherJsonData = widget.weatherData;
    updateUi(weatherData: weatherJsonData);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      // 1. weather 사이트로 다시 데이터를 요청
                      var weatherData = await model.getCurrentWeather();
                      print(weatherData);
                      // 2. 가져온 데이터로 state 값을 갱신 --> 화면이 리빌드.
                      updateUi(weatherData: weatherData);
                      print('update ok..');
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CityScreen()),
                      );
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      conditionIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  message,
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}