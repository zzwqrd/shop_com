import 'package:bloc/bloc.dart';

import '../utils/loger.dart';

class AppBlocObserver extends BlocObserver {
  LoggerDebug log =
      LoggerDebug(headColor: LogColors.white, constTitle: 'App Bloc Observer');
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log.blue('${bloc.runtimeType} ( onCreate )');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (change.nextState.runtimeType.toString().contains("Failed")) {
      log.red(
          '${bloc.runtimeType}  ( onChange ), ${change.currentState.runtimeType}==> ${change.nextState.runtimeType}');
    } else {
      log.green(
          '${bloc.runtimeType}  ( onChange ), ${change.currentState.runtimeType}==> ${change.nextState.runtimeType}');
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log.red('${bloc.runtimeType} ( onError ), $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log.yellow('${bloc.runtimeType} ( onClose )');
  }
}
