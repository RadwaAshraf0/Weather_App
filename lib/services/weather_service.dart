import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '1d75f7e09b684de7ba4135733250504';
  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String city}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$city&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error']['message'] ??'Opps! Something went wrong.';
      throw Exception(errorMessage);
    }catch (e) {
      log(e.toString());
      throw Exception('Failed to load weather data');
    }
  }
}
