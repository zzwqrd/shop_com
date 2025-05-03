// Import the constants

import 'package:easy_localization/easy_localization.dart';

extension FieldValidatorExtension on String? {
  /// Validate phone number
  String? validatePhone() {
    final regex = RegExp(r'^(00966|966|\+966|0)?5\d{8}$');
    if (this?.isEmpty == true) {
      return "the field is required".tr();
    } else if (!regex.hasMatch(this!)) {
      return "invalid phone number".tr();
    }
    return null;
  }

  /// Validate email
  String? validateEmail() {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (this?.isEmpty == true) {
      return "the field is required".tr();
    } else if (!regex.hasMatch(this!)) {
      return "email is not valid".tr();
    }
    return null;
  }

  /// Validate password
  String? validatePassword(String? confirmPassword) {
    if (this?.isEmpty == true) {
      return "the field is required".tr();
    } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,}$')
        .hasMatch(this!)) {
      return "the password must contain at least 8 characters, one uppercase letter, one lowercase letter, and one number"
          .tr();
    } else if (this!.contains(' ')) {
      return "the password must not contain spaces".tr();
    } else if (this!.length > 20) {
      return "the password must not exceed 20 characters".tr();
    } else if (this!.length < 8) {
      return "the password must be at least 8 characters".tr();
    } else if (this!.length > 20) {
      return "the password must not exceed 20 characters".tr();
    } else if (this!.contains(' ')) {
      return "the password must not contain spaces".tr();
    } else if (this != confirmPassword) {
      return "passwords do not match".tr();
    } else if (this == confirmPassword && this != null) {
      return null;
    } else if (this == confirmPassword && this == null) {
      return "the field is required".tr();
    } else if (this == confirmPassword && this == '') {
      return "the field is required".tr();
    } else if (this == confirmPassword && this != '') {
      return null;
    } else if (confirmPassword != null && this != confirmPassword) {
      return "passwords do not match".tr();
    }
    return null;
  }
}

class FieldConstants {
  static const String phone = 'Phone';
  static const String email = 'Email';
  static const String password = 'Password';
  static const String confirmPassword = 'ConfirmPassword';
}
