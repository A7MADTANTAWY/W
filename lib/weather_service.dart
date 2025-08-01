import 'package:dio/dio.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherService {
  final String basUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '1777b71f55d440d3b88182428252107';
  final Dio dio;

  WeatherService(this.dio);

  Future<WeatherModel?> getCurrentWeather({required String cityName}) async {
    try {
      Response response =
          await dio.get('$basUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      print(response.data);
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String erorrMessage = e.response?.data['error']['message'] ??
          'Opps there was an Error , Try Later ';
      throw Exception(erorrMessage);
    }
  }
}
