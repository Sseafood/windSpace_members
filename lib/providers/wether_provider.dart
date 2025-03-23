import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:windspace_members/apis/weather_service_api.dart';

// WeatherService インスタンスを作成
final weatherServiceProvider = Provider((ref) => WeatherService());

// 天気情報を非同期で取得する FutureProvider（Weather 型に変更）
final weatherProvider = FutureProvider<Weather>((ref) async {
  final weatherService = ref.read(weatherServiceProvider);
  final weatherData = await weatherService.fetchWeather();
  return Weather.fromJson(weatherData);
});

class Weather {
  final double temperature;
  final double windSpeed;
  final String description;
  final Icon icon;

  Weather({
    required this.temperature,
    required this.windSpeed,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temperature: json['main']['temp'].toDouble(),
      windSpeed: json['wind']['speed'].toDouble(),
      description: json['weather'][0]['description'],
      icon: returnWeatherIcon(json['weather'][0]['icon']),
    );
  }
}

// OpenWeatherMap のアイコンコードに応じてアイコンを返す
//https://openweathermap.org/weather-conditions参照
Icon returnWeatherIcon(String weatherIconCode) {
  switch (weatherIconCode) {
    case '01d': // 晴れ（昼）
    case '01n': // 晴れ（夜）
      return const Icon(
        Icons.wb_sunny,
        color: Color.fromARGB(255, 255, 157, 59),
      );
    case '02d': // 少し曇り（昼）
    case '02n': // 少し曇り（夜）
      return const Icon(Icons.cloud, color: Colors.grey);
    case '03d': // 曇り
    case '03n':
      return const Icon(Icons.cloud_queue, color: Colors.grey);
    case '04d': // 厚い雲
    case '04n':
      return const Icon(Icons.cloud, color: Colors.grey);
    case '09d': // 小雨
    case '09n':
      return const Icon(Icons.grain, color: Colors.blue);
    case '10d': // 雨（昼）
    case '10n': // 雨（夜）
      return const Icon(Icons.beach_access, color: Colors.blue);
    case '11d': // 雷雨
    case '11n':
      return const Icon(Icons.flash_on, color: Colors.orange);
    case '13d': // 雪
    case '13n':
      return const Icon(Icons.ac_unit, color: Colors.blueAccent);
    case '50d': // 霧
    case '50n':
      return const Icon(Icons.foggy, color: Colors.grey);
    default:
      return const Icon(Icons.help, color: Colors.grey); // 未定義の場合
  }
}
