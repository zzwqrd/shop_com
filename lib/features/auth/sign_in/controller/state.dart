import '../../../../../core/utils/enums.dart';

class LoginState {
  final RequestState requestState;
  final String msg;
  final ErrorType errorType;

  LoginState(
      {this.requestState = RequestState.initial,
      this.msg = '',
      this.errorType = ErrorType.none});

  LoginState copyWith(
          {RequestState? requestState, String? msg, ErrorType? errorType}) =>
      LoginState(
        requestState: requestState ?? this.requestState,
        msg: msg ?? this.msg,
        errorType: errorType ?? this.errorType,
      );
}
