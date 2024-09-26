import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition,
                ),
              ),
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? weatherCondition) 
{
  if (weatherCondition == null) {
    return Colors.blue;
  }
  
  if (['Sunny', 'Clear'].contains(weatherCondition)) {
    return Colors.orange; 
  } else if (['Partly cloudy', 'Cloudy', 'Overcast']
      .contains(weatherCondition)) {
    return Colors.blueGrey; 
  } else if (['Mist', 'Fog', 'Freezing fog'].contains(weatherCondition)) {
    return Colors.brown; 
  } else if ([
    'Patchy rain possible',
    'Light drizzle',
    'Patchy light drizzle',
    'Patchy light rain',
    'Light rain',
    'Light rain shower'
  ].contains(weatherCondition)) {
    return Colors.lightBlue; 
  } else if ([
    'Moderate rain at times',
    'Moderate rain',
    'Heavy rain at times',
    'Heavy rain',
    'Torrential rain shower',
    'Moderate or heavy rain shower'
  ].contains(weatherCondition)) {
    return Colors.blue; 
  } else if ([
    'Patchy snow possible',
    'Light snow',
    'Patchy light snow',
    'Light snow showers',
    'Blowing snow',
    'Moderate or heavy snow showers',
    'Patchy moderate snow',
    'Moderate snow',
    'Patchy heavy snow',
    'Heavy snow',
    'Blizzard'
  ].contains(weatherCondition)) {
    return Colors.lightBlue; 
  } else if ([
    'Patchy sleet possible',
    'Light sleet',
    'Moderate or heavy sleet',
    'Light sleet showers',
    'Moderate or heavy sleet showers'
  ].contains(weatherCondition)) {
    return Colors.blueGrey; 
  } else if ([
    'Thundery outbreaks possible',
    'Patchy light rain with thunder',
    'Moderate or heavy rain with thunder',
    'Patchy light snow with thunder',
    'Moderate or heavy snow with thunder'
  ].contains(weatherCondition)) {
    return Colors.deepPurple; 
  } else if ([
    'Ice pellets',
    'Light showers of ice pellets',
    'Moderate or heavy showers of ice pellets'
  ].contains(weatherCondition)) {
    return Colors.cyan; 
  } else if ([
    'Freezing drizzle',
    'Patchy freezing drizzle possible',
    'Light freezing rain',
    'Moderate or heavy freezing rain'
  ].contains(weatherCondition)) {
    return Colors.lightBlue; 
  }

  return Colors.grey; 
}

