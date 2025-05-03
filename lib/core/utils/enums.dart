enum RequestState {
  loading,
  done,
  error,
  empty,
  initial;

  bool get isLoading => this == RequestState.loading;

  bool get isDone => this == RequestState.done;

  bool get isError => this == RequestState.error;

  bool get isEmpty => this == RequestState.empty;

  bool get isInitial => this == RequestState.initial;
}

enum ErrorType {
  network,
  server,
  backEndValidation,
  unknown,
  none,
  unAuth,
  empty;

  bool get isNetwork => this == ErrorType.network;

  bool get isServer => this == ErrorType.server;

  bool get isBackEndValidation => this == ErrorType.backEndValidation;

  bool get isUnknown => this == ErrorType.unknown;

  bool get isEmpty => this == ErrorType.empty;

  bool get isUnAuth => this == ErrorType.unAuth;

  bool get isNone => this == ErrorType.none;
}

/// Enhanced response states
enum ResponseState {
  success,
  noInternet,
  poorConnection,
  timeout,
  badRequest,
  unauthorized,
  forbidden,
  notFound,
  validationError,
  tooManyRequests,
  serverError,
  cancelled,
  badCertificate,
  unknownError;

  bool get isSuccess => this == ResponseState.success;
  bool get isNoInternet => this == ResponseState.noInternet;
  bool get isPoorConnection => this == ResponseState.poorConnection;
  bool get isTimeout => this == ResponseState.timeout;
  bool get isBadRequest => this == ResponseState.badRequest;
  bool get isUnauthorized => this == ResponseState.unauthorized;
  bool get isForbidden => this == ResponseState.forbidden;
  bool get isNotFound => this == ResponseState.notFound;
  bool get isValidationError => this == ResponseState.validationError;
  bool get isTooManyRequests => this == ResponseState.tooManyRequests;
  bool get isServerError => this == ResponseState.serverError;
  bool get isCancelled => this == ResponseState.cancelled;
  bool get isBadCertificate => this == ResponseState.badCertificate;
  bool get isUnknownError => this == ResponseState.unknownError;
}

/// Enhanced error types
enum ErrorRequestType {
  noInternet,
  poorConnection,
  timeout,
  badRequest,
  unauthorized,
  forbidden,
  notFound,
  validationError,
  tooManyRequests,
  serverError,
  cancelled,
  badCertificate,
  malformedResponse,
  unknown;

  bool get isNoInternet => this == ErrorRequestType.noInternet;
  bool get isPoorConnection => this == ErrorRequestType.poorConnection;
  bool get isTimeout => this == ErrorRequestType.timeout;
  bool get isBadRequest => this == ErrorRequestType.badRequest;
  bool get isUnauthorized => this == ErrorRequestType.unauthorized;
  bool get isForbidden => this == ErrorRequestType.forbidden;
  bool get isNotFound => this == ErrorRequestType.notFound;
  bool get isValidationError => this == ErrorRequestType.validationError;
  bool get isTooManyRequests => this == ErrorRequestType.tooManyRequests;
  bool get isServerError => this == ErrorRequestType.serverError;
  bool get isCancelled => this == ErrorRequestType.cancelled;
  bool get isBadCertificate => this == ErrorRequestType.badCertificate;
  bool get isMalformedResponse => this == ErrorRequestType.malformedResponse;
  bool get isUnknown => this == ErrorRequestType.unknown;
}
