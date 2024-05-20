import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "There is no weather 😊",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            "Please choose city ✔",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
