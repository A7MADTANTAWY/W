import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState());

  Future<void> getWeather({required String cityName}) async {
    try {
      emit(NoWeatherState());

      WeatherModel weatherModel =
          (await WeatherService(Dio()).getCurrentWeather(cityName: cityName))!;

      emit(WeatherLoadedstate(weatherModel));
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
