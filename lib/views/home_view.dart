import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cuibt.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather/views/search_view.dart';
import 'package:weather/widgets/noWeather_body.dart';
import 'package:weather/widgets/weather_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchView()),
              );
            },
            icon: const Icon(Icons.search),
            color: Colors.white,
          )
        ],
      ),
      body: BlocBuilder<GetWeatherCuibt, WeatherState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Builder(
                builder: (_) {
                  if (state is WeatherLoadingState) {
                    return WeatherBody(weather: state.weatherModel);
                  } else if (state is WeatherInitialState) {
                    return const NoWeather();
                  } else {
                    return const Center(
                      child: Text(
                        "Oops! Something went wrong.",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
