import 'dart:io';

import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;
  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  @override
  ServerFailure(super.errorMessage);
  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with API server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with API server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with API server');
      case DioExceptionType.cancel:
        return ServerFailure('Request to API server was cancelled');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection error with API server');

      case DioExceptionType.badResponse:
        return ServerFailure.badResponseHandling(dioException);
      case DioExceptionType.unknown:
        if (dioException.error is SocketException) {
          return ServerFailure('No Internet connection');
        }
        return ServerFailure('Unexpected error , please try again later');
    }
  }

  factory ServerFailure.badResponseHandling(DioException dioException) {
    switch (dioException.response?.statusCode) {
      case 400:
        return ServerFailure(
          dioException.response?.data['error']['message'] ?? 'Bad request',
        );
      case 401:
        return ServerFailure(
          dioException.response?.data['error']['message'] ?? 'Unauthorized',
        );
      case 403:
        return ServerFailure(
          dioException.response?.data['error']['message'] ?? 'Forbidden',
        );
      case 404:
        return ServerFailure(
          dioException.response?.data['error']['message'] ?? 'Not found',
        );
      case 500:
        return ServerFailure(
          dioException.response?.data['error']['message'] ?? 'Server error',
        );
      default:
        return ServerFailure(
          'Bad response with status code: ${dioException.response?.statusCode}',
        );
    }
  }

  /// This method is used to handle bad responses from the server and return a ServerFailure with a specific error message based on the status code.
  // ServerFailure badResponseHandling(DioException dioException) {
  //   switch (dioException.response?.statusCode) {
  //     case 400:
  //       return ServerFailure(
  //         dioException.response?.data['error']['message'] ?? 'Bad request',
  //       );
  //     case 401:
  //       return ServerFailure(
  //         dioException.response?.data['error']['message'] ?? 'Unauthorized',
  //       );
  //     case 403:
  //       return ServerFailure(
  //         dioException.response?.data['error']['message'] ?? 'Forbidden',
  //       );
  //     case 404:
  //       return ServerFailure(
  //         dioException.response?.data['error']['message'] ?? 'Not found',
  //       );
  //     case 500:
  //       return ServerFailure(
  //         dioException.response?.data['error']['message'] ?? 'Server error',
  //       );
  //     default:
  //       return ServerFailure(
  //         'Bad response with status code: ${dioException.response?.statusCode}',
  //       );
  //   }
  // }

  // factory ServerFailure.fromBadResponse(int statusCode, {dynamic response}) {
  //   if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
  //     return ServerFailure(
  //       response?['error']['message'] ??
  //           'Client error with status code: $statusCode',
  //     );
  //   } else if (statusCode == 404) {
  //     return ServerFailure(
  //       response?['error']['message'] ?? 'Resource not found',
  //     );
  //   } else if (statusCode == 500) {
  //     return ServerFailure(
  //       response?['error']['message'] ??
  //           'Server error with status code: $statusCode',
  //     );
  //   } else {
  //     return ServerFailure('Opps, something went wrong try again later');
  //   }
  // }
}
