import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weatger_cubit/getweather_states.dart';

import '../Class(models)/Weather_Model.dart';
import '../Services/WeatherServices.dart';

//  <> to tell the cubit the state will use to call ui
class GetWeatherCubit extends Cubit<WeatherState> {
  // the thing i want to send to ui
  WeatherModel? trigeer;
  
  GetWeatherCubit():super(NoWeatherState());

// logic inside cubit
  getweather({required String cityname}) async {
    try {
       trigeer =
          await WeatherSevice(Dio()).getweatherinfo(cityname: cityname);

// if logic success
      emit(WeatherLoadedSuccess());

    } catch (e) {
      emit(WeatherFailure(e.toString()));
    }
  }
}
