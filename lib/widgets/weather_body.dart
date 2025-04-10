import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cuibt.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/utils/weather_color.dart';
import 'package:weather/utils/weather_images.dart';
import 'package:weather/widgets/customText%20_widget.dart';

class WeatherBody extends StatelessWidget {
  const WeatherBody({super.key, required this.weather});
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCuibt>(context).weatherModel!;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            createMaterialColor(weatherModel.weatherCondition)[800]!,
            createMaterialColor(weatherModel.weatherCondition),
            createMaterialColor(weatherModel.weatherCondition)[100]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SingleChildScrollView(
        // ⬅️ Scroll here
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.1,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: "${weatherModel.temperature.round()}°",
                size: screenWidth * 0.15,
                color: Colors.white,
                isBold: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.location_city_outlined,
                      size: screenWidth * 0.07,
                    ),
                    color: Colors.white,
                  ),
                  CustomText(
                    text: weatherModel.cityName,
                    size: screenWidth * 0.08,
                    color: Colors.blueGrey[900]!,
                    isBold: true,
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomText(
                    text: "Max: ${weatherModel.maxTemp.round()}°",
                    size: screenWidth * 0.06,
                    color: Colors.white,
                  ),
                  CustomText(
                    text: "Min: ${weatherModel.minTemp.round()}°",
                    size: screenWidth * 0.06,
                    color: Colors.white,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                child: Image.asset(
                  getWeatherImageAsset(weatherModel.weatherCondition),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              CustomText(
                text: weatherModel.weatherCondition,
                size: screenWidth * 0.08,
                color: Colors.white,
                isBold: true,
              ),
              CustomText(
                text:
                    "Update: ${DateFormat('hh:mm a').format(weatherModel.date)}",
                size: screenWidth * 0.05,
                color: Colors.blueGrey[900]!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
