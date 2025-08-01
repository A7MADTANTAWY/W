import 'package:weather_app/model/weather_model.dart';

class WeatherState {}

class NoWeatherState extends WeatherState {}

class WeatherLoadedstate extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedstate(this.weatherModel);
}

class WeatherFailureState extends WeatherState {}
