import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../../main.dart';

class UserModel extends Equatable {
  // Private constructor for singleton
  const UserModel._({
    this.message = "",
    this.data,
  });

  // Singleton instance
  static UserModel instance = const UserModel._();

  // Factory constructor for creating from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel._(
      message: json["message"] ?? "",
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  final String message;
  final Data? data;

  // Convert to JSON
  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
      };

  // Authentication check
  bool get isAuth => data?.access?.token.isNotEmpty ?? false;

  // Save to SharedPreferences
  Future<void> save() async {
    final json = toJson();
    await preferences.setString("user", jsonEncode(json));
    _updateInstance(json);
  }

  // Clear user data
  static Future<void> clear() async {
    await preferences.remove("user");
    instance = const UserModel._();
  }

  // Load user data
  static Future<UserModel> load() async {
    try {
      final userJson = preferences.getString('user');
      if (userJson != null && userJson.isNotEmpty) {
        final json = jsonDecode(userJson);
        instance = UserModel.fromJson(json);
      }
      return instance;
    } catch (e) {
      // Handle error (e.g., corrupt JSON)
      await clear();
      return instance;
    }
  }

  // Update singleton instance
  static void _updateInstance(Map<String, dynamic> json) {
    instance = UserModel.fromJson(json);
  }

  @override
  List<Object?> get props => [message, data];
}

class Data extends Equatable {
  const Data({
    required this.user,
    required this.access,
  });

  final User? user;
  final Access? access;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      user: json["user"] == null ? null : User.fromJson(json["user"]),
      access: json["access"] == null ? null : Access.fromJson(json["access"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "access": access?.toJson(),
      };

  @override
  List<Object?> get props => [
        user,
        access,
      ];
}

class Access extends Equatable {
  const Access({
    required this.authType,
    required this.token,
    required this.expiresAt,
  });

  final String authType;
  final String token;
  final DateTime? expiresAt;

  factory Access.fromJson(Map<String, dynamic> json) {
    return Access(
      authType: json["auth_type"] ?? "",
      token: json["token"] ?? "",
      expiresAt: DateTime.tryParse(json["expires_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "auth_type": authType,
        "token": token,
        "expires_at": expiresAt?.toIso8601String(),
      };

  @override
  List<Object?> get props => [
        authType,
        token,
        expiresAt,
      ];
}

class User extends Equatable {
  const User({
    required this.id,
    required this.name,
    required this.phone,
    required this.phoneVerified,
    required this.email,
    required this.emailVerified,
    required this.isActive,
    required this.profilePhoto,
    required this.gender,
    required this.dateOfBirth,
    required this.country,
    required this.phoneCode,
  });

  final int id;
  final String name;
  final String phone;
  final bool phoneVerified;
  final String email;
  final bool emailVerified;
  final bool isActive;
  final String profilePhoto;
  final dynamic gender;
  final dynamic dateOfBirth;
  final String country;
  final String phoneCode;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      phone: json["phone"] ?? "",
      phoneVerified: json["phone_verified"] ?? false,
      email: json["email"] ?? "",
      emailVerified: json["email_verified"] ?? false,
      isActive: json["is_active"] ?? false,
      profilePhoto: json["profile_photo"] ?? "",
      gender: json["gender"],
      dateOfBirth: json["date_of_birth"],
      country: json["country"] ?? "",
      phoneCode: json["phone_code"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "phone_verified": phoneVerified,
        "email": email,
        "email_verified": emailVerified,
        "is_active": isActive,
        "profile_photo": profilePhoto,
        "gender": gender,
        "date_of_birth": dateOfBirth,
        "country": country,
        "phone_code": phoneCode,
      };

  @override
  List<Object?> get props => [
        id,
        name,
        phone,
        phoneVerified,
        email,
        emailVerified,
        isActive,
        profilePhoto,
        gender,
        dateOfBirth,
        country,
        phoneCode,
      ];
}
