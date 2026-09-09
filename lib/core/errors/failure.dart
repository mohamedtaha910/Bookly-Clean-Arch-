import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});
  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMessage: "Connection timeout with ApiServer");
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: "Send timeout with ApiServer");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: "Receive timeout with ApiServer");
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: "Bad certificate with ApiServer");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response?.statusCode ?? 0,
          dioError.response?.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: "Request canceled with ApiServer");
      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: "No internet connection");
      case DioExceptionType.unknown:
        return ServerFailure(
          errorMessage: "Unexpected error , please try again!",
        );
      case DioExceptionType.transformTimeout:
        return ServerFailure(errorMessage: "Transform timeout with ApiServer");
    }
  }

  /// Creates a [ServerFailure] instance based on the HTTP status code and response data.
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errorMessage: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(
        errorMessage: 'Your request not found, Please try later',
      );
    } else if (statusCode == 500) {
      return ServerFailure(
        errorMessage: 'Internal Server error, Please try later',
      );
    } else if (statusCode == 429) {
      return ServerFailure(errorMessage: 'Too many requests, Please try later');
    } else {
      return ServerFailure(
        errorMessage: 'Opps there was an error, Please try later',
      );
    }
  }
}
