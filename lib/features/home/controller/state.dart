import '../../../../core/utils/enums.dart';

class HomeState {
  final RequestState requestState;
  final String msg;
  final ErrorType errorType;

  HomeState({
    this.requestState = RequestState.initial,
    this.msg = '',
    this.errorType = ErrorType.none,
  });

  HomeState copyWith({
    RequestState? requestState,
    String? msg,
    ErrorType? errorType,
  }) =>
      HomeState(
        requestState: requestState ?? this.requestState,
        msg: msg ?? this.msg,
        errorType: errorType ?? this.errorType,
      );
}
