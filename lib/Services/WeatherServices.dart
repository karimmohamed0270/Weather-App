import 'package:dio/dio.dart';
import 'package:weather/Class(models)/Weather_Model.dart';

class WeatherSevice {
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '2108f905a68742fa846130832231809';

  final Dio dio;
  WeatherSevice(this.dio);

  // the data type will send is weathermodel object123456

  Future<WeatherModel> getweatherinfo({required cityname}) async {
    try {
      Response respone = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityname&days=1');

      // Map<String,dynamic>jasondata=respone.data; 

      // list of object
      // so i built the object in onle line using factory

      WeatherModel weathermodel = WeatherModel.fromjason(respone.data);

      return weathermodel;
      
    } on DioException catch (e) {

      throw Exception(e.response?.data["error"]["message"] ??
          "opps there is the problem but we dont know it try later");
    }

    // another ecxeption not from api
    catch (e) {
      throw Exception("opps there is error");
    }
  }
}
