
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/error/error_handling.dart';
import '../../../../core/services/api_service.dart';
import '../model/weather_model.dart';
import 'home_repo.dart';

class HomeRepoImpl extends HomeRepository {
  final ApiService client;

  HomeRepoImpl(this.client);

  @override
  Future<Either<IErrorHandler, WeatherModel>> getTodayWeather(
      double? latitude, double? longitude) async {
    try {
      var result =
          await client.get(endPoint: EndPoint.todayWeather, parameters: {
        'lat': latitude.toString(),
        'lon': longitude.toString(),
      });
      final weather = WeatherModel.fromJson(result);
      return right(weather);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.handel(e));
      } else {
        return left(ServerFailure("ERROR :: ${e.toString()}"));
      }
    }
  }
}
