import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  static const String apiKey = '5fb199de5079f82e8b45d89904b54496'; // 取得したAPIキー
  static const String apiUrl =
      'https://api.openweathermap.org/data/2.5/weather?lat=34.950976&lon=136.826552&appid=$apiKey&units=metric';

  Future<Map<String, dynamic>> fetchWeather() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('天気情報の取得に失敗しました');
      }
    } catch (e) {
      throw Exception('エラー: $e');
    }
  }
}
