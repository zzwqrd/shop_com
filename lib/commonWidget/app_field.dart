import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:connectivity_plus/connectivity_plus.dart'; // Added connectivity_plus package

import '../core/utils/app_styles.dart';
import '../core/utils/extensions.dart';
import '../core/utils/field_extensions.dart';
import '../core/utils/input_decoration_extensions.dart';
import '../gen/locale_keys.g.dart';
import 'loading.dart';


Future<bool> checkInternetConnectivity() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.none) {
    return false;
  }
  return true;
}


class AppCustomForm extends StatefulWidget {
  final String? hintText, title;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String? v)? validator;
  final bool isRequired, loading;
  final int maxLines;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final Widget? suffixIcon, prefixIcon;
  final Color? fillColor;
  final String? initialValue;
  final bool withBorder;
  final InputBorder? border;

  const AppCustomForm({
    super.key,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.validator,
    this.isRequired = true,
    this.loading = false,
    this.onTap,
    this.onChanged,
    this.maxLines = 1,
    this.suffixIcon,
    this.prefixIcon,
    this.fillColor,
    this.title,
    this.initialValue,
    this.withBorder = true,
    this.border,
  });

  /// Factory constructor for Email field
  factory AppCustomForm.email({
    String? hintText,
    title,
    TextEditingController? controller,
    bool isRequired = true,
    String? Function(String? v)? validator,
    bool loading = false,
    void Function(String)? onChanged,
    void Function()? onTap,
    Widget? suffixIcon,
    Widget? prefixIcon,
    Color? fillColor,
    String? initialValue,
    bool withBorder = true,
    InputBorder? border,
  }) {
    return AppCustomForm(
      hintText: hintText,
      controller: controller,
      keyboardType: FieldType.email.keyboardType,
      validator: (v) {
        if (isRequired && v?.isEmpty == true) {
          return "This field is required".tr();
        }
        return v.validateEmail();
      },
      isRequired: isRequired,
      loading: loading,
      onChanged: onChanged,
      onTap: onTap,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      fillColor: fillColor,
      title: title ?? "البريد الإلكتروني",
      initialValue: initialValue,
      withBorder: withBorder,
      border: border,
    );
  }

  /// Factory constructor for Password field
  factory AppCustomForm.password({
    String? hintText,
    TextEditingController? controller,
    bool isRequired = true,
    String? Function(String? v)? validator,
    bool loading = false,
    void Function(String)? onChanged,
    void Function()? onTap,
    Widget? suffixIcon,
    Widget? prefixIcon,
    Color? fillColor,
    String? initialValue,
    bool withBorder = true,
    InputBorder? border,
  }) {
    return AppCustomForm(
      hintText: hintText ?? tr(LocaleKeys.auth_password_placeholder),
      controller: controller,
      keyboardType: FieldType.password.keyboardType,
      validator: (value) {
        if (value == null || value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
      isRequired: isRequired,
      loading: loading,
      onChanged: onChanged,
      onTap: onTap,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      fillColor: fillColor,
      title: tr(LocaleKeys.auth_password_placeholder),
      initialValue: initialValue,
      withBorder: withBorder,
      border: border,
    );
  }

  /// Factory constructor for Confirm Password field
  factory AppCustomForm.confirmPassword({
    String? hintText,
    title,
    TextEditingController? controller,
    bool isRequired = true,
    String? Function(String? v)? validator,
    bool loading = false,
    void Function(String)? onChanged,
    void Function()? onTap,
    Widget? suffixIcon,
    Widget? prefixIcon,
    Color? fillColor,
    String? initialValue,
    bool withBorder = true,
    InputBorder? border,
  }) {
    return AppCustomForm(
      hintText: hintText,
      controller: controller,
      keyboardType: FieldType.password.keyboardType,
      validator: (v) {
        if (isRequired && v?.isEmpty == true) {
          return "This field is required".tr();
        }
        return v.validatePassword(initialValue);
      },
      isRequired: isRequired,
      loading: loading,
      onChanged: onChanged,
      onTap: onTap,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      fillColor: fillColor,
      title: title ?? "تأكيد كلمة المرور",
      initialValue: initialValue,
      withBorder: withBorder,
      border: border,
    );
  }

  /// Factory constructor for Phone field
  factory AppCustomForm.phone({
    String? hintText,
    TextEditingController? controller,
    bool isRequired = true,
    String? Function(String? v)? validator,
    bool loading = false,
    void Function(String)? onChanged,
    void Function()? onTap,
    Widget? suffixIcon,
    Widget? prefixIcon,
    Color? fillColor,
    String? initialValue,
    bool withBorder = true,
    InputBorder? border,
  }) {
    return AppCustomForm(
      hintText: hintText ?? tr(LocaleKeys.auth_phone_placeholder),
      controller: controller,
      keyboardType: FieldType.phone.keyboardType,
      validator: (v) {
        if (isRequired && v?.isEmpty == true) {
          return "This field is required".tr();
        }
        return v.validatePhone();
      },
      isRequired: isRequired,
      loading: loading,
      onChanged: onChanged,
      onTap: onTap,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      fillColor: fillColor,
      title: tr(LocaleKeys.auth_phone_placeholder),
      initialValue: initialValue,
      withBorder: withBorder,
      border: border,
    );
  }

  /// Factory constructor for Text field
  factory AppCustomForm.text({
    String? hintText,
    title,
    TextEditingController? controller,
    bool isRequired = true,
    String? Function(String? v)? validator,
    bool loading = false,
    void Function(String)? onChanged,
    void Function()? onTap,
    Widget? suffixIcon,
    Widget? prefixIcon,
    Color? fillColor,
    String? initialValue,
    bool withBorder = true,
    InputBorder? border,
  }) {
    return AppCustomForm(
      hintText: hintText,
      controller: controller,
      keyboardType: FieldType.text.keyboardType,
      validator: validator ??
          (v) {
            if (isRequired && v?.isEmpty == true) {
              return "This field is required".tr();
            }
            return validator?.call(v);
          },
      isRequired: isRequired,
      loading: loading,
      onChanged: onChanged,
      onTap: onTap,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      fillColor: fillColor,
      title: title,
      initialValue: initialValue,
      withBorder: withBorder,
      border: border,
    );
  }

  @override
  State<AppCustomForm> createState() => _AppCustomFormState();
}

class _AppCustomFormState extends State<AppCustomForm> {
  bool showPass = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title?.isNotEmpty == true)
          Text(
            widget.title!,
            style: AppStyles.mediumText.copyWith(fontSize: 14),
          ).withPadding(bottom: 8.h),
        TextFormField(
          initialValue: widget.initialValue,
          onChanged: widget.onChanged,
          maxLines: widget.maxLines,
          readOnly: widget.onTap != null,
          onTap: widget.onTap,
          obscureText:
              widget.keyboardType == TextInputType.visiblePassword && !showPass,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          validator: widget.validator,
          inputFormatters: [
            if ([TextInputType.phone, TextInputType.number]
                .contains(widget.keyboardType))
              FilteringTextInputFormatter.digitsOnly,
          ],
          style: AppStyles.smallText.copyWith(fontSize: 15),
          textInputAction: widget.maxLines == 1
              ? TextInputAction.done
              : TextInputAction.newline,
          decoration: InputDecoration(
            hintText: widget.hintText ?? widget.title ?? '',
            fillColor: widget.fillColor,
            prefixIcon: buildPrefixIcon(context),
            suffixIcon: buildSuffixIcon(context),
          ).applyInputDecorationTheme(AppStyles.inputDecorationTheme),
        ),
      ],
    );
  }

  Widget? buildSuffixIcon(BuildContext context) {
    if (widget.suffixIcon != null) {
      return widget.suffixIcon!;
    } else if (widget.loading) {
      return SizedBox(
        height: 20.h,
        width: 20.h,
        child: CustomProgress(size: 15.h),
      );
    } else if (widget.onTap != null) {
      return Icon(
        Icons.keyboard_arrow_down_sharp,
        size: 16,
        color: "#113342".color,
      );
    } else if (widget.keyboardType == TextInputType.visiblePassword) {
      return GestureDetector(
        onTap: () {
          setState(() {
            showPass = !showPass;
          });
        },
        child: Icon(
          showPass ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
          size: 16,
          color: showPass ? context.secondaryColor : context.hintColor,
        ),
      );
    }
    return null;
  }

  Widget? buildPrefixIcon(BuildContext context) {
    return widget.prefixIcon?.withPadding(end: 10.w);
  }
}

enum FieldType {
  email,
  password,
  confirmPassword,
  phone,
  text;

  TextInputType get keyboardType {
    switch (this) {
      case FieldType.email:
        return TextInputType.emailAddress;
      case FieldType.password:
        return TextInputType.visiblePassword;
      case FieldType.phone:
        return TextInputType.phone;
      case FieldType.text:
        return TextInputType.text;
      default:
        return TextInputType.text;
    }
  }
}

// Example usage of AppCustomForm in a registration screen

class RegistrationScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
      ),
      body: FutureBuilder<bool>(
        future: checkInternetConnectivity(),
        builder: (context, snapshot) {
          if (snapshot.hasData && !snapshot.data!) {
            return Center(child: Text('No internet connection'));
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name Field
                AppCustomForm.text(
                  hintText: "Enter your name",
                  controller: _nameController,
                  isRequired: true,
                  title: "Name",
                ).withPadding(bottom: 16.h),

                // Email Field
                AppCustomForm.email(
                  hintText: "Enter your email",
                  controller: _emailController,
                  isRequired: true,
                ).withPadding(bottom: 16.h),

                // Password Field
                AppCustomForm.password(
                  hintText: "Enter your password",
                  controller: _passwordController,
                  isRequired: true,
                ).withPadding(bottom: 16.h),

                // Confirm Password Field
                AppCustomForm.confirmPassword(
                  hintText: "Confirm your password",
                  controller: _confirmPasswordController,
                  initialValue: _passwordController.text,
                  isRequired: true,
                ).withPadding(bottom: 16.h),

                // Phone Field
                AppCustomForm.phone(
                  hintText: "Enter your phone number",
                  controller: _phoneController,
                  isRequired: true,
                ).withPadding(bottom: 16.h),

                // Submit Button
                ElevatedButton(
                  onPressed: () async {
                    // Perform validation and submission
                    if (await _validateFields(context)) {
                      print("Form Submitted Successfully");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(context.w, 50.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Text("Register", style: TextStyle(fontSize: 16.sp)),
                ),
              ],
            ),
          );
        }
      ),
    );
  }

  /// Validates all fields before submission
  Future<bool> _validateFields(BuildContext context) async {
    final hasInternet = await checkInternetConnectivity();
    if (!hasInternet) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No internet connection')));
      return false;
    }
    final emailValid = _emailController.text.validateEmail() == null;
    final passwordValid =
        _passwordController.text.validatePassword(_passwordController.text) ==
            null;
    final confirmPasswordValid = _confirmPasswordController.text
            .validatePassword(_passwordController.text) ==
        null;
    final phoneValid = _phoneController.text.validatePhone() == null;

    if (!emailValid) {
      print("Invalid Email");
      return false;
    }
    if (!passwordValid) {
      print("Invalid Password");
      return false;
    }
    if (!confirmPasswordValid) {
      print("Passwords do not match");
      return false;
    }
    if (!phoneValid) {
      print("Invalid Phone Number");
      return false;
    }

    return true;
  }
}