import 'dart:convert';
import 'package:http/http.dart';

class ApiHelper {
  Future<dynamic> getWeatherDataWithLocation(
      {required double lat, required double lon}) async {
    // 1. 요청 주소를 만든다.
    // https://api.openweathermap.org/data/2.5/weather?lat=37&lon=127&appid=5df3f1b99c9227bb6bb15d61c2b5bf9b
    var url = Uri.https(
      'api.openweathermap.org',
      '/data/2.5/weather',
      {
        'lat': lat.toString(),
        'lon': lon.toString(),
        'units': 'metric',
        'appid': '5df3f1b99c9227bb6bb15d61c2b5bf9b',
      },
    );
    // 2. get 방식으로 요청을 보내고 응답을 받는다.
    Response response = await get(url);
    // 3. 응답 받은 결과를 JSON 포맷으로 변환한다.
    var weatherData = jsonDecode(response.body);
    return weatherData;
  }
}