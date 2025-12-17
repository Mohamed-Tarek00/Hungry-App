import 'package:dio/dio.dart';
import 'package:hungryapp/core/utils/service_locator.dart';
import 'dio_helper.dart';

class ApiService {
  final Dio _dio;

  ApiService() : _dio = getIt<DioHelper>().createDio();

  Future<dynamic> get({required String endPoint}) async {
    final response = await _dio.get(endPoint);
    return response.data;
  }

  Future<dynamic> post({required String endPoint, required Map data}) async {
    final response = await _dio.post(endPoint, data: data);
    return response.data;
  }

  Future<dynamic> put({required String endPoint, required Map data}) async {
    final response = await _dio.put(endPoint, data: data);
    return response.data;
  }

  Future<dynamic> delete({required String endPoint}) async {
    final response = await _dio.delete(endPoint);
    return response.data;
  }
}
