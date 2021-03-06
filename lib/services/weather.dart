import 'package:clima_flutter_stub/services/location.dart';
import 'package:clima_flutter_stub/services/networking.dart';

class WeatherModel {

  Future<dynamic> getWeatherWithCityName({required String cityName}) async {
    ApiHelper apiHelper = ApiHelper();
    var weatherData = await apiHelper.getWeatherDataWithCityName(cityName: cityName);
    return weatherData;
  }

  Future<dynamic> getCurrentWeather() async {
    LocationHelper locationHelper = LocationHelper();
    await locationHelper.getCurrentLocation();
    ApiHelper apiHelper = ApiHelper();
    var weatherData = await apiHelper.getWeatherDataWithLocation(
      lat: locationHelper.latitude,
      lon: locationHelper.longitude,
    );
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
