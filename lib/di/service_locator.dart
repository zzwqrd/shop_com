import 'package:get_it/get_it.dart';

import '../features/auth/sign_in/controller/controller.dart';
import '../features/home/controller/bloc.dart';
import '../features/layout/controller/controller.dart';
import '../features/splash/controller/controller.dart';
import '../features/auth/register/controller/controller.dart'; // Added import
import '../features/offers/controller/controller.dart'; // Added import for OffersController

final GetIt sl = GetIt.instance;

Future<void> initGitIt() async {
  sl.registerFactory(() => SplashController());
  sl.registerFactory(() => LoginController());
  sl.registerLazySingleton(() => NavigationBloc());
  sl.registerFactory(() => HomeController());
  sl.registerFactory(() => OrdersCubit());
  sl.registerFactory(() => RegisterController()); // Added registration
  sl.registerFactory(() => OffersController()); // Added registration for OffersController
}