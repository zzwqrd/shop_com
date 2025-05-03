// Extension on BuildContext for form field utilities
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../commonWidget/app_field.dart';

extension AppFormFieldExtension on BuildContext {
  // Method to validate email using a robust regex pattern
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required".tr();
    }
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    if (!emailRegex.hasMatch(value)) {
      return "Please enter a valid email address".tr();
    }
    return null;
  }

  // Method to validate password
  String? validatePassword(String? value, {String? confirmPassword}) {
    if (value == null || value.isEmpty) {
      return "This field is required".tr();
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters long".tr();
    }
    if (confirmPassword != null && value != confirmPassword) {
      return "Passwords do not match".tr();
    }
    return null;
  }

  // Method to validate phone number using a regex pattern
  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required".tr();
    }
    final phoneRegex =
        RegExp(r"^\+?[1-9]\d{9,14}$"); // E.164 international phone format
    if (!phoneRegex.hasMatch(value)) {
      return "Please enter a valid phone number".tr();
    }
    return null;
  }

  // Method to create an email field
  Widget emailField({
    String? hintText,
    TextEditingController? controller,
    bool isRequired = true,
    void Function(String)? onChanged,
    void Function()? onTap,
    Widget? suffixIcon,
    Widget? prefixIcon,
    Color? fillColor,
    String? initialValue,
    bool withBorder = true,
    InputBorder? border,
  }) {
    return AppCustomForm.email(
      hintText: hintText,
      controller: controller,
      isRequired: isRequired,
      validator: validateEmail,
      onChanged: onChanged,
      onTap: onTap,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      fillColor: fillColor,
      initialValue: initialValue,
      withBorder: withBorder,
      border: border,
    );
  }

  // Method to create a password field
  Widget passwordField({
    String? hintText,
    TextEditingController? controller,
    bool isRequired = true,
    void Function(String)? onChanged,
    void Function()? onTap,
    Widget? suffixIcon,
    Widget? prefixIcon,
    Color? fillColor,
    String? initialValue,
    bool withBorder = true,
    InputBorder? border,
  }) {
    return AppCustomForm.password(
      hintText: hintText,
      controller: controller,
      isRequired: isRequired,
      validator: (v) => validatePassword(v),
      onChanged: onChanged,
      onTap: onTap,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      fillColor: fillColor,
      initialValue: initialValue,
      withBorder: withBorder,
      border: border,
    );
  }

  // Method to create a confirm password field
  Widget confirmPasswordField({
    String? hintText,
    TextEditingController? controller,
    bool isRequired = true,
    void Function(String)? onChanged,
    void Function()? onTap,
    Widget? suffixIcon,
    Widget? prefixIcon,
    Color? fillColor,
    String? initialValue,
    bool withBorder = true,
    InputBorder? border,
  }) {
    return AppCustomForm.confirmPassword(
      hintText: hintText,
      controller: controller,
      isRequired: isRequired,
      validator: (v) => validatePassword(v, confirmPassword: controller?.text),
      onChanged: onChanged,
      onTap: onTap,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      fillColor: fillColor,
      initialValue: initialValue,
      withBorder: withBorder,
      border: border,
    );
  }

  // Method to create a phone field
  Widget phoneField({
    String? hintText,
    TextEditingController? controller,
    bool isRequired = true,
    void Function(String)? onChanged,
    void Function()? onTap,
    Widget? suffixIcon,
    Widget? prefixIcon,
    Color? fillColor,
    String? initialValue,
    bool withBorder = true,
    InputBorder? border,
  }) {
    return AppCustomForm.phone(
      hintText: hintText,
      controller: controller,
      isRequired: isRequired,
      validator: validatePhone,
      onChanged: onChanged,
      onTap: onTap,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      fillColor: fillColor,
      initialValue: initialValue,
      withBorder: withBorder,
      border: border,
    );
  }

  // Method to create a generic text field
  Widget textField({
    String? hintText,
    TextEditingController? controller,
    bool isRequired = true,
    String? Function(String?)? customValidator,
    void Function(String)? onChanged,
    void Function()? onTap,
    Widget? suffixIcon,
    Widget? prefixIcon,
    Color? fillColor,
    String? initialValue,
    bool withBorder = true,
    InputBorder? border,
  }) {
    return AppCustomForm.text(
      hintText: hintText,
      controller: controller,
      isRequired: isRequired,
      validator: (v) {
        if (customValidator != null) {
          return customValidator(v);
        }
        if (isRequired && v?.isEmpty == true) {
          return "This field is required".tr();
        }
        return null;
      },
      onChanged: onChanged,
      onTap: onTap,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      fillColor: fillColor,
      initialValue: initialValue,
      withBorder: withBorder,
      border: border,
    );
  }
}

// Extension on String for validation utilities
extension StringValidation on String {
  // Method to validate if a string is a valid email
  bool isValidEmail() {
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return emailRegex.hasMatch(this);
  }
}


// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final emailController = TextEditingController();
//     final passwordController = TextEditingController();
//     final confirmPasswordController = TextEditingController();
//     final phoneController = TextEditingController();

//     return Scaffold(
//       appBar: AppBar(title: Text("Form Example")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             context.emailField(
//               hintText: "Enter your email",
//               controller: emailController,
//             ),
//             SizedBox(height: 16),
//             context.passwordField(
//               hintText: "Enter your password",
//               controller: passwordController,
//             ),
//             SizedBox(height: 16),
//             context.confirmPasswordField(
//               hintText: "Confirm your password",
//               controller: confirmPasswordController,
//             ),
//             SizedBox(height: 16),
//             context.phoneField(
//               hintText: "Enter your phone number",
//               controller: phoneController,
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 print("Form submitted");
//               },
//               child: Text("Submit"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }