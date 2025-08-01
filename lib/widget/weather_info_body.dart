import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weatherModel});
  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getThemColor(weatherModel.weatherCondition),
            getThemColor(weatherModel.weatherCondition)[300] ??
                Colors.transparent,
            getThemColor(weatherModel.weatherCondition)[50] ??
                Colors.transparent,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // اسم المدينة
            Text(
              weatherModel.cityName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36,
              ),
            ),
            const SizedBox(height: 8),

            // توقيت التحديث
            Text(
              'Updated at ${weatherModel.date.hour.toString().padLeft(2, '0')}:${weatherModel.date.minute.toString().padLeft(2, '0')}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 32),

            // صف الطقس
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // صورة الطقس
                Image.network(
                  weatherModel.image ??
                      'https://cdn-icons-png.flaticon.com/512/869/869869.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error, size: 80);
                  },
                ),

                // نوع الطقس
                Column(
                  children: [
                    Text(
                      weatherModel.weatherCondition,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${weatherModel.temp}°C',
                      style: const TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),

                // درجات الحرارة
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Max: ${weatherModel.maxTemp}°',
                        style: const TextStyle(fontSize: 16)),
                    Text('Min: ${weatherModel.minTemp}°',
                        style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// تحسين الألوان حسب الحالة الجوية
MaterialColor getThemColor(String condition) {
  switch (condition.toLowerCase()) {
    case 'sunny':
      return Colors.orange;
    case 'rainy':
      return Colors.blue;
    case 'cloudy':
      return Colors.grey;
    case 'stormy':
      return Colors.purple;
    case 'snowy':
      return Colors.lightBlue;
    default:
      return Colors.blueGrey;
  }
}
