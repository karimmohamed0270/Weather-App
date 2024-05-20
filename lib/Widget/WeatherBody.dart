import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Class(models)/Weather_Model.dart';
import 'package:weather/cubits/getweather_cubit.dart';
import 'package:weather/main.dart';

class WeatherBody extends StatelessWidget {
  const WeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    // recive data from cubit(trigger object data) should not nullable
    WeatherModel trigeer = BlocProvider.of<GetWeatherCubit>(context).trigeer!;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          get_theme_color(trigeer.weathercondtion),
          // palete of matriel color
          get_theme_color(trigeer.weathercondtion)[300]!,
          get_theme_color(trigeer.weathercondtion)[200]!


        ],

        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              trigeer.city,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text("Updated at :  ${trigeer.date.hour}: ${trigeer.date.minute}"),
            SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(trigeer.image!),
                SizedBox(
                  width: 18,
                ),
                Text(
                  trigeer.temp.round().toString(),
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 17,
                ),
                Text(
                  "Max Temp is ${trigeer.maxtemp.toString()}",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 18,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              trigeer.weathercondtion,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
