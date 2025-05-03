import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../core/utils/flash_helper.dart';
import '../core/routes/app_routes_fun.dart';
import '../core/routes/routes.dart'; // تعديل حسب مشروعك

class InternetChecker {
  final _logger = LoggerDebugInternet(
      headColor: LogColorsInternet.reset, constTitle: "InternetChecker");

  // Singleton instance
  static final InternetChecker _instance = InternetChecker._internal();
  factory InternetChecker() => _instance;
  InternetChecker._internal();

  late StreamSubscription<InternetStatus> _subscription;

  /// Check internet connection instantly
  Future<bool> hasInternet() async {
    final hasConnection = await InternetConnection().hasInternetAccess;
    if (!hasConnection) {
      _logger.red("No internet connection detected.");
    } else {
      _logger.green("Internet is available.");
    }
    return hasConnection;
  }

  /// Show internet error screen/modal/dialog if disconnected
  Future<void> checkAndShowInternetDialogIfNotAvailable(
      BuildContext? context) async {
    final isConnected = await hasInternet();
    if (!isConnected && context != null) {
      _showInternetDialog(context);
    }
  }

  /// Show dialog when no internet
  void _showInternetDialog(BuildContext context) {
    FlashHelper.showToast(
      'please check your internet connection', // أو استخدم نص ثابت إذا لم تستخدم EasyLocalization
      type: MessageTypeTost.fail,
    );
    FlashHelper.showToast("No Internet", type: MessageTypeTost.warning);

    // يمكنك استخدام showModalBottomSheet أو Navigator.push
    // مثال باستخدام pushAndRemoveUntil كما في مشروعك:
    // pushAndRemoveUntil(NamedRoutes.i.internet);
  }

  /// Start monitoring internet changes globally
  void startMonitoring() {
    _subscription = InternetConnection().onStatusChange.listen((status) {
      final isConnected = status == InternetStatus.connected;
      _logger.green("Internet status changed: $status");

      if (!isConnected) {
        FlashHelper.showToast("No Internet", type: MessageTypeTost.warning);

        // pushAndRemoveUntil(NamedRoutes.i.internet);
      } else {
        pushAndRemoveUntil(NamedRoutes.i.splash);
      }
    });
  }

  /// Stop listening to internet changes
  void stopMonitoring() {
    _subscription.cancel();
  }
}

// Helper logger class from your project
class LoggerDebugInternet {
  LoggerDebugInternet({this.headColor = "", this.constTitle});
  String headColor;
  String? constTitle;

  void red(String message, [String? title]) {
    print("${LogColorsInternet.red}$message${LogColorsInternet.reset}");
  }

  void green(String message, [String? title]) {
    print("${LogColorsInternet.green}$message${LogColorsInternet.reset}");
  }
}

class LogColorsInternet {
  static String reset = "\x1B[0m";
  static String red = "\x1B[31m";
  static String green = "\x1B[32m";
}
