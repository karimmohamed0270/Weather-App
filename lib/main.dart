import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Views/HomeScreen.dart';
import 'package:weather/cubits/get_weatger_cubit/getweather_states.dart';
import 'package:weather/cubits/getweather_cubit.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // bloc provider step 4 in cubit on matrial app because contain 2 pages effect and affect on 
    return BlocProvider(
        create: (context) => GetWeatherCubit(),
        child: Builder(
          // 1 build to renove error frm context should after cubit context use builder widget.

          //2  bloc builder widget using cubit to manage state auto.

          builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              return MaterialApp(
                theme: ThemeData(
                  primarySwatch: get_theme_color(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .trigeer
                          ?.weathercondtion),
                ),
                debugShowCheckedModeBanner: false,
                home: HomeScreen(),
              );
            },
          ),
        ));
  }
}

MaterialColor get_theme_color(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }

  if (condition == "Sunny") {
    return Colors.orange;
  } else if (condition == "Partly cloudy") {
    return Colors.blue;
  } else if (condition == "Heavy Cloud") {
    return Colors.cyan;
  } else if (condition == "Fog") {
    return Colors.grey;
  } else {
    return Colors.green;
  }
}
