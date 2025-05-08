import '../../../../core/utils/enums.dart';

class RegisterState {
  final RequestState requestState;
  final String msg;
  final ErrorType errorType;

  RegisterState({
    this.requestState = RequestState.initial,
    this.msg = '',
    this.errorType = ErrorType.none,
  });

  RegisterState copyWith({
    RequestState? requestState,
    String? msg,
    ErrorType? errorType,
  }) =>
      RegisterState(
        requestState: requestState ?? this.requestState,
        msg: msg ?? this.msg,
        errorType: errorType ?? this.errorType,
      );
}
