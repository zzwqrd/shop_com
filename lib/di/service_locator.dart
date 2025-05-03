import 'package:get_it/get_it.dart';

import '../features/auth/sign_in/controller/controller.dart';
import '../features/home/controller/bloc.dart';
import '../features/layout/controller/controller.dart';
import '../features/splash/controller/controller.dart';

final GetIt sl = GetIt.instance;

Future<void> initGitIt() async {
  sl.registerFactory(() => SplashController());
  sl.registerFactory(() => LoginController());
  sl.registerLazySingleton(() => NavigationBloc());
  sl.registerFactory(() => HomeController());
}
