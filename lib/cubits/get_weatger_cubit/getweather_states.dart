import '../../Class(models)/Weather_Model.dart';

class WeatherState{

}

// state 1 o screen
class NoWeatherState  extends WeatherState{

}

// state 2 o screen
class WeatherLoadedSuccess extends WeatherState {

//  final WeatherModel trigeer;

//   WeatherLoadedSuccess(this.trigeer);

}

// state 3 o screen

class WeatherFailure extends WeatherState{
 final String errormess;

  WeatherFailure(this.errormess);

}
