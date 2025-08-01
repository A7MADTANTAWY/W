import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: const WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherState>(
      builder: (context, state) {
        String condition = 'default';

        if (state is WeatherLoadedstate) {
          condition = state.weatherModel.weatherCondition;
        }

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: getThemColor(condition),
            appBarTheme: AppBarTheme(
              backgroundColor: getThemColor(condition),
              elevation: 0,
              foregroundColor: Colors.white,
            ),
          ),
          home: const HomeView(),
        );
      },
    );
  }

  /// ✅ دي الفانكشن اللي بتغير ألوان الثيم حسب الجو
  MaterialColor getThemColor(String condition) {
    switch (condition.toLowerCase()) {
      case 'sunny':
      case 'clear':
        return Colors.orange;

      case 'cloudy':
      case 'partly cloudy':
      case 'patchy rain nearby':
        return Colors.blueGrey;

      case 'rainy':
      case 'showers':
      case 'patchy rain possible':
        return Colors.blue;

      case 'thunderstorm':
        return Colors.deepPurple;

      case 'snow':
        return Colors.cyan;

      case 'mist':
      case 'fog':
        return Colors.grey;
      default:
        return Colors.blueGrey; // ✅ اللون الافتراضي بقى أبيض
    }
  }
}
