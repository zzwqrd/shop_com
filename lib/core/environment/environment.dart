import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get fileName {
    return kReleaseMode ? ".env.production" : ".env.development";
  }

  static Future<void> load() async {
    try {
      await dotenv.load(fileName: fileName);
      validateRequiredVariables();
    } catch (e) {
      throw Exception("Failed to load environment variables: $e");
    }
  }

  // تشفير قيمة الرمز (Token)
  static String encryptToken(String token) {
    final key = encrypt.Key.fromUtf8(
        '7d9c8e4f3a1b6c5d2e8f9a0b1c3d4e5f'); // مفتاح التشفير الآمن
    final iv = encrypt.IV.fromLength(16);

    try {
      final encrypter = encrypt.Encrypter(encrypt.AES(key));
      return encrypter.encrypt(token, iv: iv).base64;
    } catch (e) {
      throw Exception("Failed to encrypt token: $e");
    }
  }

  // المسار الأساسي غير مشفر
  static String get apiUrl {
    final url = dotenv.env["API_URL"];
    if (url == null || url.isEmpty) {
      throw Exception("API_URL is missing or invalid in the .env file");
    }
    return url; // إرجاع المسار كما هو دون تشفير
  }

  // المفتاح مشفر
  static String get apiKey {
    final key = dotenv.env["API_KEY"];
    if (key == null || key.isEmpty) {
      throw Exception("API_KEY is missing or invalid in the .env file");
    }
    return _encrypt(key); // تشفير المفتاح
  }

  static void validateRequiredVariables() {
    final requiredVariables = ["API_URL", "API_KEY"];
    for (final variable in requiredVariables) {
      if (dotenv.env[variable] == null || dotenv.env[variable]!.isEmpty) {
        throw Exception("$variable is missing or invalid in the .env file");
      }
    }
  }

  static String _decrypt(String encryptedValue) {
    final key = encrypt.Key.fromUtf8(
        '7d9c8e4f3a1b6c5d2e8f9a0b1c3d4e5f'); // مفتاح التشفير الآمن
    final iv = encrypt.IV.fromLength(16);

    try {
      final encrypter = encrypt.Encrypter(encrypt.AES(key));
      return encrypter.decrypt64(encryptedValue, iv: iv);
    } catch (e) {
      throw Exception("Failed to decrypt value: $e");
    }
  }

  static String _encrypt(String plainText) {
    final key = encrypt.Key.fromUtf8(
        '7d9c8e4f3a1b6c5d2e8f9a0b1c3d4e5f'); // مفتاح التشفير الآمن
    final iv = encrypt.IV.fromLength(16);

    try {
      final encrypter = encrypt.Encrypter(encrypt.AES(key));
      return encrypter.encrypt(plainText, iv: iv).base64;
    } catch (e) {
      throw Exception("Failed to encrypt value: $e");
    }
  }
}
