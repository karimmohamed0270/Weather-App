import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Views/SearchScreen.dart';
import 'package:weather/Widget/NoWeatherBody.dart';
import 'package:weather/cubits/get_weatger_cubit/getweather_states.dart';
import 'package:weather/cubits/getweather_cubit.dart';

import '../Widget/WeatherBody.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return SearchScreen();
                    },
                  ));
                },
                icon: Icon(Icons.search)),
          ],
          // backgroundColor: Colors.blue,
          title: Text("Weather App"),
        ),

        // if else  but trigger in other screen in dart

        // step 5 integrate
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is NoWeatherState) {
              return NoWeatherBody();
            } else if (state is WeatherLoadedSuccess) {
              return WeatherBody();
            } else {
              return Text("There is an error opps");
            }
          },
        ));
  }
}
