import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Class(models)/Weather_Model.dart';
import 'package:weather/Services/WeatherServices.dart';
import 'package:weather/cubits/getweather_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search a city"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextField(
            // to take value from users
            // value == that store what the user input
            onSubmitted: (value) async {
              //   // @@@@@@@trigeer request  and the return the type of it weathermode  why ? to use it in ui
              // logic i write it then in fuctuin in cubit

              // WeatherModel  trigeer =
              //       await WeatherSevice(Dio()).getweatherinfo(cityname: value);

              // step6

              var cubit = BlocProvider.of<GetWeatherCubit>(context);
              cubit.getweather(cityname: value);

              Navigator.pop(context);
            },

            // defualt decoration of text field
            decoration: InputDecoration(
              // to make hiegt to text field
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 35),
              labelText: "Search",
              hintText: "Enter the city",
              // to add icon and the end of the text field
              suffixIcon: const Icon(Icons.search),
              // edit border (defualt as color of app bar)
              // radius will change but color will defualt as the app bar
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Colors.orange),
              ),

              //  decoration when enable that when i can press in it but i dont i will do(color before i press)
              // enabledBorder:
              // OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(32),
              //   borderSide:const  BorderSide(color: Colors.green),
              //  ),

              //  focusedBorder:
              // //  after i press
              // const  OutlineInputBorder(
              //   borderSide: BorderSide(color: Colors.red),
              //  ),
            ),
          ),
        ),
      ),
    );
  }
}
