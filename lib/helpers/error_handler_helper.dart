import 'package:dio/dio.dart';

class ErrorHandlerHelper {
  static String mapErrorToMessage(
    int? statusCode,
  ) {
    switch (statusCode) {
      case 401:
        return 'Unauthorized - Authentication failed.';
      case 404:
        return 'Not Found - The resource you requested was not found.';
      case 429:
        return 'Too Many Requests - Rate limit exceeded.';
      case 500:
        return 'Internal Server Error - Something went wrong on the server.';
      case 502:
        return 'Bad Gateway - The server received an invalid response.';
      case 503:
        return 'Service Unavailable - The server is currently unavailable.';
      case 504:
        return 'Gateway Timeout - The server took too long to respond.';
      default:
        return 'Unexpected Error - An unexpected error occurred (Status Code: $statusCode).';
    }
  }

  static String handleError(
    DioException e,
  ) {
    if (e.response != null && e.response!.statusCode != null) {
      return mapErrorToMessage(
        e.response!.statusCode,
      );
    } else {
      return 'Network Error - Failed to connect to the server.';
    }
  }
}
