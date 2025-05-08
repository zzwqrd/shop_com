import 'dart:convert';

import 'package:alicom/core/utils/extensions.dart';
import 'package:alicom/core/utils/loger.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class Model {
  dynamic id;
  final _loggerDebug =
      LoggerDebug(headColor: LogColors.red, constTitle: "Error while parsing");
  // final _firebaseCrashlytics = KiwiContainer().resolve<FirebaseCrashlyticsConfig>();
  Model({this.id = ''});
  bool get hasData => id.isNotEmpty;

  @override
  bool operator ==(other) =>
      other is Model && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
  Map<String, dynamic> toJson() => {'id': id};

  @override
  String toString() {
    return jsonEncode(toJson());
  }

  Color colorFromJson(dynamic json, String attribute,
      {String defaultHexColor = "#000000"}) {
    try {
      if (json == null || json[attribute] == null) {
        return defaultHexColor.color;
      } else {
        return json[attribute].toString().color;
      }
    } catch (e) {
      _loggerDebug
          .red("there are an error in this key : \"\"$attribute\"\" error: $e");
      // _firebaseCrashlytics.jsonToDartRecordError(e, StackTrace.current, attribute, jsonEncode(json ?? {}), "color_from_json");
      return defaultHexColor.color;
    }
  }

  String stringFromJson(dynamic json, String attribute,
      {String defaultValue = ''}) {
    try {
      if (json == null || json[attribute] == null) {
        return defaultValue;
      } else {
        return (json[attribute] ?? defaultValue).toString();
      }
    } catch (e) {
      _loggerDebug
          .red("there are an error in this key : \"\"$attribute\"\" error: $e");
      // _firebaseCrashlytics.jsonToDartRecordError(e, StackTrace.current, attribute, jsonEncode(json ?? {}), "string_from_json");
      return defaultValue;
    }
  }

  DateTime dateFromJson(dynamic json, String attribute,
      {DateTime? defaultValue, String? parseingFormat}) {
    defaultValue ??= DateTime(0);
    try {
      if (json == null || json[attribute] == null) {
        return defaultValue;
      } else if (parseingFormat != null) {
        return DateFormat(parseingFormat, 'en')
            .parse(json[attribute].toString().replaceAll('Z', ""));
      } else {
        return DateTime.parse(json[attribute]);
      }
    } catch (e) {
      _loggerDebug
          .red("there are an error in this key : \"\"$attribute\"\" error: $e");
      // _firebaseCrashlytics.jsonToDartRecordError(e, StackTrace.current, attribute, jsonEncode(json ?? {}), "date_from_json");
      return defaultValue;
    }
  }

  int intFromJson(dynamic json, String attribute, {int defaultValue = 0}) {
    try {
      if (json == null || json[attribute] == null) {
        return defaultValue;
      } else {
        return double.tryParse(json[attribute].toString())?.toInt() ??
            json[attribute];
      }
    } catch (e) {
      _loggerDebug
          .red("there are an error in this key : \"\"$attribute\"\" error: $e");
      // _firebaseCrashlytics.jsonToDartRecordError(e, StackTrace.current, attribute, jsonEncode(json ?? {}), "int_from_json");
      return defaultValue;
    }
  }

  double doubleFromJson(dynamic json, String attribute,
      {int? fix, double defaultValue = 0.0}) {
    try {
      if (json == null || json[attribute] == null) {
        return defaultValue;
      } else if (fix != null) {
        return double.parse(
            (double.tryParse(json[attribute].toString()) ?? json[attribute])
                .toStringAsFixed(fix));
      } else {
        return double.parse(
            (double.tryParse(json[attribute].toString()) ?? json[attribute])
                .toString());
      }
    } catch (e) {
      _loggerDebug
          .red("there are an error in this key : \"\"$attribute\"\" error: $e");
      // _firebaseCrashlytics.jsonToDartRecordError(e, StackTrace.current, attribute, jsonEncode(json ?? {}), "double_from_json");
      return defaultValue;
    }
  }

  bool boolFromJson(dynamic json, String attribute,
      {bool defaultValue = false}) {
    try {
      if (json == null || json[attribute] == null) {
        return defaultValue;
      } else if (json[attribute] is bool) {
        return json[attribute];
      } else if ((json[attribute] is String) &&
          ['1', 'true'].contains(json[attribute])) {
        return true;
      } else if ((json[attribute] is int) && json[attribute] == 1) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      _loggerDebug
          .red("there are an error in this key : \"\"$attribute\"\" error: $e");
      // _firebaseCrashlytics.jsonToDartRecordError(e, StackTrace.current, attribute, jsonEncode(json ?? {}), "bool_from_json");
      return defaultValue;
    }
  }

  // List<T> listFromJsonArray<T>(Map<String, dynamic> json, List<String> attribute, T Function(Map<String, dynamic>) callback) {
  //   String attr = attribute.firstWhere((element) => (json[element] != null), orElse: () => null);
  //   return listFromJson(json, attr, callback);
  // }

  List<T> listFromJson<T>(dynamic json, String attribute,
      {required T Function(Map<String, dynamic> e) callback}) {
    try {
      List<T> list = <T>[];
      if (json != null &&
          json[attribute] != null &&
          json[attribute] is List &&
          json[attribute].length > 0) {
        json[attribute].forEach((v) {
          if (v is Map<String, dynamic>) {
            list.add(callback(v));
          }
        });
      }
      return list;
    } catch (e) {
      _loggerDebug
          .red("there are an error in this key : \"\"$attribute\"\" error: $e");
      // _firebaseCrashlytics.jsonToDartRecordError(e, StackTrace.current, attribute, jsonEncode(json ?? {}), "list_from_json");
      return [];
    }
  }

  List<T>? listNullFromJson<T>(dynamic json, String attribute,
      {required T Function(Map<String, dynamic> e) callback}) {
    try {
      if (json == null || json[attribute] == null || json[attribute] is! List) {
        return null;
      } else {
        List<T> list = <T>[];
        if (json[attribute].length > 0) {
          json[attribute].forEach((v) {
            if (v is Map<String, dynamic>) {
              list.add(callback(v));
            }
          });
        }
        return list;
      }
    } catch (e) {
      _loggerDebug
          .red("there are an error in this key : \"\"$attribute\"\" error: $e");
      // _firebaseCrashlytics.jsonToDartRecordError(e, StackTrace.current, attribute, jsonEncode(json ?? {}), "list_from_json");
      return null;
    }
  }

  // T objectFromJson<T>(Map<String, dynamic> json, String attribute, T Function(Map<String, dynamic>) callback, {T defaultValue = null}) {
  //   try {
  //     if (json != null && json[attribute] != null && json[attribute] is Map<String, dynamic>) {
  //       return callback(json[attribute]);
  //     }
  //     return defaultValue;
  //   } catch (e) {
  //     throw Exception('Error while parsing ' + attribute + '[' + e.toString() + ']');
  //   }
  // }
}
