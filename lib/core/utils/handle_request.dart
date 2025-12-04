import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hungryapp/core/error/failure.dart';

Future<Either<Failure, T>> handleRequest<T>({
  required Future<T> Function() request,
}) async {
  try {
    final response = await request();
    return right(response);
  } on DioException catch (dioError) {
    return left(ServiceFailure.fromDio(dioError));
  } catch (e) {
    return left(ServiceFailure(e.toString()));
  }
}
