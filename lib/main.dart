import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cuibt.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather/utils/weather_color.dart';
import 'package:weather/views/welcome_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCuibt(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCuibt, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: createMaterialColor(
                    BlocProvider.of<GetWeatherCuibt>(context)
                        .weatherModel?.weatherCondition),
              ),
              debugShowCheckedModeBanner: false,
              home: const WelcomePage(),
            );
          },
        );
      }),
    );
  }
}
