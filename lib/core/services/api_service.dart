
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl:"https://api.openweathermap.org/data/2.5/" ,
      receiveDataWhenStatusError: true,
    ),
  );

  Future<Map<String, dynamic>> get({
    required String endPoint,
    required Map<String, dynamic> parameters,
  }) async {
    parameters['appid'] = "0d6fcc64f466e44f8423b74f21ba91e5";
    Response response = await _dio.get(endPoint, queryParameters: parameters);
    return response.data;
  }
}
