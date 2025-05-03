import 'package:dartz/dartz.dart';

import '../utils/enums.dart';

/// Enhanced HelperResponse class with factory constructors for different states
class HelperResponse<T> {
  final ResponseState state;
  final int statusCode;
  final bool success;
  final String message;
  final T? data;
  final ErrorRequestType? errorType;
  final dynamic rawError;
  final StackTrace? stackTrace;

  HelperResponse({
    required this.state,
    this.statusCode = 0,
    required this.success,
    required this.message,
    this.data,
    this.errorType,
    this.rawError,
    this.stackTrace,
  });

  // Factory constructors for different response states
  factory HelperResponse.success({
    int statusCode = 200,
    String message = 'Success',
    T? data,
  }) =>
      HelperResponse<T>(
        state: ResponseState.success,
        statusCode: statusCode,
        success: true,
        message: message,
        data: data,
      );
  factory HelperResponse.malformedResponse({
    int statusCode = 500,
    String message = 'Malformed response',
    T? data,
    ErrorRequestType errorType = ErrorRequestType.malformedResponse,
  }) =>
      HelperResponse<T>(
        state: ResponseState.badRequest,
        statusCode: statusCode,
        success: false,
        message: message,
        data: data,
        errorType: errorType,
      );
  factory HelperResponse.noInternet({
    int statusCode = 503,
    String message = 'No internet connection',
  }) =>
      HelperResponse<T>(
        state: ResponseState.noInternet,
        statusCode: statusCode,
        success: false,
        message: message,
        errorType: ErrorRequestType.noInternet,
      );

  factory HelperResponse.poorConnection({
    int statusCode = 503,
    String message = 'Poor internet connection',
  }) =>
      HelperResponse<T>(
        state: ResponseState.poorConnection,
        statusCode: statusCode,
        success: false,
        message: message,
        errorType: ErrorRequestType.poorConnection,
      );

  factory HelperResponse.timeout({
    int statusCode = 408,
    String message = 'Request timeout',
  }) =>
      HelperResponse<T>(
        state: ResponseState.timeout,
        statusCode: statusCode,
        success: false,
        message: message,
        errorType: ErrorRequestType.timeout,
      );

  factory HelperResponse.badRequest({
    int statusCode = 400,
    String message = 'Bad request',
    dynamic error,
  }) =>
      HelperResponse<T>(
        state: ResponseState.badRequest,
        statusCode: statusCode,
        success: false,
        message: message,
        errorType: ErrorRequestType.badRequest,
        rawError: error,
      );

  factory HelperResponse.unauthorized({
    int statusCode = 401,
    String message = 'Unauthorized',
  }) =>
      HelperResponse<T>(
        state: ResponseState.unauthorized,
        statusCode: statusCode,
        success: false,
        message: message,
        errorType: ErrorRequestType.unauthorized,
      );

  factory HelperResponse.forbidden({
    int statusCode = 403,
    String message = 'Forbidden',
  }) =>
      HelperResponse<T>(
        state: ResponseState.forbidden,
        statusCode: statusCode,
        success: false,
        message: message,
        errorType: ErrorRequestType.forbidden,
      );

  factory HelperResponse.notFound({
    int statusCode = 404,
    String message = 'Not found',
  }) =>
      HelperResponse<T>(
        state: ResponseState.notFound,
        statusCode: statusCode,
        success: false,
        message: message,
        errorType: ErrorRequestType.notFound,
      );

  factory HelperResponse.validationError({
    int statusCode = 422,
    String message = 'Validation error',
    dynamic errors,
  }) =>
      HelperResponse<T>(
        state: ResponseState.validationError,
        statusCode: statusCode,
        success: false,
        message: message,
        errorType: ErrorRequestType.validationError,
        rawError: errors,
      );

  factory HelperResponse.tooManyRequests({
    int statusCode = 429,
    String message = 'Too many requests',
  }) =>
      HelperResponse<T>(
        state: ResponseState.tooManyRequests,
        statusCode: statusCode,
        success: false,
        message: message,
        errorType: ErrorRequestType.tooManyRequests,
      );

  factory HelperResponse.serverError({
    int statusCode = 500,
    String message = 'Server error',
  }) =>
      HelperResponse<T>(
        state: ResponseState.serverError,
        statusCode: statusCode,
        success: false,
        message: message,
        errorType: ErrorRequestType.serverError,
      );

  factory HelperResponse.cancelled({
    int statusCode = 499,
    String message = 'Request cancelled',
  }) =>
      HelperResponse<T>(
        state: ResponseState.cancelled,
        statusCode: statusCode,
        success: false,
        message: message,
        errorType: ErrorRequestType.cancelled,
      );

  factory HelperResponse.badCertificate({
    int statusCode = 495,
    String message = 'Bad certificate',
  }) =>
      HelperResponse<T>(
        state: ResponseState.badCertificate,
        statusCode: statusCode,
        success: false,
        message: message,
        errorType: ErrorRequestType.badCertificate,
      );

  factory HelperResponse.unknownError({
    int statusCode = 0,
    String message = 'Unknown error',
    dynamic error,
    StackTrace? stackTrace,
  }) =>
      HelperResponse<T>(
        state: ResponseState.unknownError,
        statusCode: statusCode,
        success: false,
        message: message,
        errorType: ErrorRequestType.unknown,
        rawError: error,
        stackTrace: stackTrace,
      );

  // Helper methods
  bool get isSuccess => state == ResponseState.success;
  bool get hasData => data != null;
  bool get hasError => !success;

  // Convert response to another type
  HelperResponse<R> map<R>(R Function(T? data) mapper) {
    return HelperResponse<R>(
      state: state,
      statusCode: statusCode,
      success: success,
      message: message,
      data: mapper(data),
      errorType: errorType,
      rawError: rawError,
      stackTrace: stackTrace,
    );
  }

  // Handle success and error cases
  R when<R>({
    required R Function(T? data) success,
    required R Function(String message, ErrorRequestType? errorType) error,
  }) {
    if (isSuccess) {
      return success(data);
    } else {
      return error(message, errorType);
    }
  }

  // Convert response to Either<HelperResponse, T>
  Either<HelperResponse, T> toEither() {
    if (isSuccess) {
      return Right(data as T);
    } else {
      return Left(this);
    }
  }

// Generic method to handle response and map data
  Either<HelperResponse, R> toEitherWithMapper<R>(R Function(T? data) mapper) {
    return isSuccess ? Right(mapper(data)) : Left(this);
  }

  @override
  String toString() {
    return 'HelperResponse(state: $state, statusCode: $statusCode, success: $success, '
        'message: $message, data: $data, errorType: $errorType)';
  }
}
