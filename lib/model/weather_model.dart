class WeatherModel {
  final String cityName;
  final DateTime date;
  final String? image;
  final String temp;
  final String maxTemp;
  final String minTemp;
  final String weatherCondition;

  WeatherModel(
      {required this.cityName,
      required this.date,
      this.image,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherCondition});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      image:
          'https:${json['forecast']['forecastday'][0]['day']['condition']['icon']}',
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'].toString(),
      maxTemp:
          json['forecast']['forecastday'][0]['day']['maxtemp_c'].toString(),
      minTemp:
          json['forecast']['forecastday'][0]['day']['mintemp_c'].toString(),
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
    );
  }
}


//http://api.weatherapi.com/v1/forecast.json?key=1777b71f55d440d3b88182428252107&q=cairo&days=1