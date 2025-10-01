import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with API server');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with API server');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with API server');

      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate from server');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioError.response!.statusCode!,dioError.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure('Request to the server was cancelled');

      case DioExceptionType.connectionError:
        return ServerFailure('No Internet connection');

      case DioExceptionType.unknown:
      default:
        return ServerFailure('Unexpected error occurred');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request was not found, please try again');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error, please try later');
    } else {
      return ServerFailure('Oops! There was an error, please try again');
    }
  }
}
