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
