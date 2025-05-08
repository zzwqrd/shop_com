import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/routes/app_routes_fun.dart';
import '../../../core/routes/routes.dart';
import '../../../core/utils/flash_helper.dart';
import '../../auth/sign_in/controller/model.dart';

class SplashController extends Cubit<SplashState> {
  SplashController() : super(SplashInitial()) {
    // InternetChecker().startMonitoring();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    emit(SplashLoadingState());
    try {
      // Attempt to load user data
      final userLoaded = await _loadUserData();
      if (!userLoaded) {
        emit(SplashErrorState(message: 'Failed to load user data.'));
        pushAndRemoveUntil(NamedRoutes.i.login);
        return;
      }

      await Future.delayed(const Duration(seconds: 3));

      if (UserModel.instance.isAuth) {
        pushAndRemoveUntil(NamedRoutes.i.layout);
      } else {
        pushAndRemoveUntil(NamedRoutes.i.layout);
      }

      emit(UserLoadedState(isAuthenticated: UserModel.instance.isAuth));
    } catch (e) {
      _handleError(e);
    }
  }

  Future<bool> _loadUserData() async {
    try {
      await UserModel.load();
      return true;
    } catch (e) {
      FlashHelper.showToast(
        'Error loading user data: ${e.toString()}',
        type: MessageTypeTost.fail,
      );
      return false;
    }
  }

  void retryInitialization() {
    emit(SplashRetryState());
    _initializeApp();
  }

  void _handleError(dynamic error) {
    FlashHelper.showToast(
      'An error occurred: ${error.toString()}',
      type: MessageTypeTost.fail,
    );
    emit(SplashErrorState(message: error.toString()));
  }
}

class SplashState {}

class SplashInitial extends SplashState {}

class SplashLoadingState extends SplashState {}

class InternetNotAvailableState extends SplashState {}

class UserLoadedState extends SplashState {
  final bool isAuthenticated;
  UserLoadedState({required this.isAuthenticated});
}

class SplashErrorState extends SplashState {
  final String message;
  SplashErrorState({required this.message});
}

class SplashRetryState extends SplashState {}
