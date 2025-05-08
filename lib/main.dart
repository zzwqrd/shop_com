import 'dart:io';
import 'dart:ui';

import 'package:croppy/croppy.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/get_platform.dart';
import 'config/internet_checker.dart';
import 'core/routes/app_routes.dart';
import 'core/routes/app_routes_fun.dart';
import 'core/services/bloc_observer.dart';
import 'core/utils/app_themes.dart';
import 'core/utils/loger.dart';
import 'core/utils/phoneix.dart';
import 'core/utils/unfucs.dart';
import 'di/service_locator.dart' as di;
import 'features/auth/sign_in/controller/model.dart';

final logger = LoggerDebug(headColor: LogColors.green);
final internetChecker = InternetChecker();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  logger.green(
      " اللهم صلي وسلم وبارك على سيدنا محمد وعلى آله وصحبه   💕💕💕💕💕💕💕💕💕💕");
  preferences = await SharedPreferences.getInstance();
  await UserModel.load();
  print(">>>>>>>>>>>>>>>> ${UserModel.instance.isAuth}");
  await _init();
  await di.initGitIt();
  await EasyLocalization.ensureInitialized();

  // Start internet monitoring from edited code.  This is crucial
  InternetChecker().startMonitoring();


  await ScreenUtil.ensureScreenSize();

  Bloc.observer = AppBlocObserver();

  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]),
  ]).then((value) {
    runApp(
      EasyLocalization(
        path: 'assets/lang',
        saveLocale: true,
        startLocale: const Locale('ar'),
        fallbackLocale: const Locale('en'),
        supportedLocales: const [Locale('ar'), Locale('en')],
        child: const MyApp(),
      ),
    );
  });
}

Future<void> _init() async {
  pt = PlatformInfo.getCurrentPlatformType();
  if (pt.isNotWeb) croppyForceUseCassowaryDartImpl = true;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812), // Using edited designSize
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Alicom', //Using edited title
            initialRoute: AppRoutes.init.initial,
            routes: AppRoutes.init.appRoutes,
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: AppThemes.light, //Using edited theme
            onGenerateRoute: AppRoutes.onGenerateRoute, //using edited route
            scrollBehavior: MaterialScrollBehavior().copyWith(dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
              PointerDeviceKind.stylus,
              PointerDeviceKind.unknown
            }),
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              for (var locale in supportedLocales) {
                if (deviceLocale != null &&
                    deviceLocale.languageCode == locale.languageCode) {
                  return deviceLocale;
                }
              }
              return supportedLocales.first;
            },
            builder: (context, child) {
              ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
                return Scaffold(
                    appBar: AppBar(
                        elevation: 0, backgroundColor: Colors.white));
              };
              return Phoenix(
                child: MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                      textScaler: TextScaler.linear(
                          1.sp > 1.2 ? 1.2 : 1.sp)),
                  child: Unfocus(child: child ?? const SizedBox.shrink()),
                ),
              );
            },
          );
        });
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final HttpClient client = super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    return client;
  }
}

late final SharedPreferences preferences;