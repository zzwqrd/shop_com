import 'dart:io';

void main() {
  // التحقق من وجود مجلدات assets الرئيسية
  final fontsDir = Directory('assets/fonts');
  final iconsDir = Directory('assets/icons');
  final langsDir = Directory('assets/lang');

  if (!fontsDir.existsSync()) {
    print('خطأ: مجلد الخطوط (assets/fonts) غير موجود.');
    return;
  }
  if (!iconsDir.existsSync()) {
    print('خطأ: مجلد الأيقونات (assets/icons) غير موجود.');
    return;
  }
  if (!langsDir.existsSync()) {
    print('خطأ: مجلد اللغات (assets/lang) غير موجود.');
    return;
  }

  // توليد كود Dart
  final buffer = StringBuffer();

  buffer.writeln('// GENERATED CODE - DO NOT MODIFY BY HAND');
  buffer.writeln('');
  buffer.writeln('class Assets {');
  buffer.writeln('  Assets._();');
  buffer.writeln('');
  buffer.writeln(
      '  static final fonts = _AssetsFonts();'); // كائن من _AssetsFonts
  buffer.writeln(
      '  static final icons = _AssetsIcons();'); // كائن من _AssetsIcons
  buffer.writeln(
      '  static final langs = _AssetsLangs();'); // كائن من _AssetsLangs
  buffer.writeln('}');
  buffer.writeln('');

  // توليد فئة الخطوط
  buffer.writeln(generateClass('_AssetsFonts', fontsDir));
  buffer.writeln('');

  // توليد فئة الأيقونات
  buffer.writeln(generateClass('_AssetsIcons', iconsDir));
  buffer.writeln('');

  // توليد فئة اللغات
  buffer.writeln(generateClass('_AssetsLangs', langsDir));

  // كتابة الكود إلى ملف داخل lib/gen/assets
  final outputDir = Directory('lib/gen/assets');
  if (!outputDir.existsSync()) {
    outputDir.createSync(recursive: true);
  }

  final outputFile = File('lib/gen/assets/generated_assets.dart');
  outputFile.writeAsStringSync(buffer.toString());
  print('تم توليد الكود بنجاح في: ${outputFile.path}');
}

/// دالة لتوليد فئة تحتوي على حقول تمثل الملفات في المجلد المحدد
String generateClass(String className, Directory directory) {
  final buffer = StringBuffer();
  buffer.writeln('class $className {');
  buffer.writeln('  $className();'); // constructor عادي (ليس const)

  for (final file in directory.listSync()) {
    if (file is File) {
      final fileName = file.path.split('/').last;
      final fieldName = toCamelCase(fileName);
      if (fieldName.isNotEmpty) {
        buffer.writeln('  final $fieldName = \'${file.path}\';');
      } else {
        print('تحذير: اسم الملف غير صالح ($fileName). تم تجاهله.');
      }
    }
  }

  buffer.writeln('}');
  return buffer.toString();
}

/// دالة لتحويل النصوص إلى تنسيق camelCase
String toCamelCase(String input) {
  // إزالة الامتداد
  final nameWithoutExtension = input.replaceAll(RegExp(r'\.[^.]+$'), '');
  // تقسيم النص بناءً على الرموز غير الصالحة مثل (_) أو (-)
  final parts = nameWithoutExtension.split(RegExp(r'[^a-zA-Z0-9]'));
  // تجاهل الأجزاء الفارغة
  final nonEmptyParts = parts.where((part) => part.isNotEmpty);
  // تحويل كل جزء إلى حالة العنوان (Title Case) ثم دمجه مع الحفاظ على تنسيق CamelCase
  final pascalCase = nonEmptyParts
      .map((part) => part[0].toUpperCase() + part.substring(1).toLowerCase())
      .join();
  // تحويل الحرف الأول إلى حالة صغيرة للحصول على تنسيق camelCase
  return pascalCase.isEmpty
      ? '' // إرجاع سلسلة فارغة إذا لم يكن هناك أي أجزاء صالحة
      : pascalCase[0].toLowerCase() + pascalCase.substring(1);
}
// // lib/core/utils/assets_generator.dart
// // dart run lib/core/utils/assets_generator.dart
// import 'dart:io';

// void main() {
//   // قراءة الموارد من مجلد assets (خارج lib)
//   final fontsDir = Directory('assets/fonts');
//   final iconsDir = Directory('assets/icons');
//   final langsDir = Directory('assets/lang');

//   // توليد كود Dart
//   final buffer = StringBuffer();

//   buffer.writeln('// GENERATED CODE - DO NOT MODIFY BY HAND');
//   buffer.writeln('');
//   buffer.writeln('class Assets {');
//   buffer.writeln('  Assets._();');
//   buffer.writeln('');
//   buffer.writeln(
//       '  static final fonts = _AssetsFonts();'); // كائن من _AssetsFonts
//   buffer.writeln(
//       '  static final icons = _AssetsIcons();'); // كائن من _AssetsIcons
//   buffer.writeln(
//       '  static final langs = _AssetsLangs();'); // كائن من _AssetsLangs
//   buffer.writeln('}');
//   buffer.writeln('');

//   // توليد فئة الخطوط
//   buffer.writeln('class _AssetsFonts {');
//   buffer.writeln('  _AssetsFonts();'); // constructor عادي (ليس const)
//   for (final file in fontsDir.listSync()) {
//     if (file is File) {
//       final fileName = file.path.split('/').last;
//       final fieldName = toCamelCase(fileName);
//       buffer.writeln('  final $fieldName = \'${file.path}\';');
//     }
//   }
//   buffer.writeln('}');
//   buffer.writeln('');

//   // توليد فئة الأيقونات
//   buffer.writeln('class _AssetsIcons {');
//   buffer.writeln('  _AssetsIcons();'); // constructor عادي (ليس const)
//   for (final file in iconsDir.listSync()) {
//     if (file is File) {
//       final fileName = file.path.split('/').last;
//       final fieldName = toCamelCase(fileName);
//       buffer.writeln('  final $fieldName = \'${file.path}\';');
//     }
//   }
//   buffer.writeln('}');
//   buffer.writeln('');

//   // توليد فئة اللغات
//   buffer.writeln('class _AssetsLangs {');
//   buffer.writeln('  _AssetsLangs();'); // constructor عادي (ليس const)
//   for (final file in langsDir.listSync()) {
//     if (file is File) {
//       final fileName = file.path.split('/').last;
//       final fieldName = toCamelCase(fileName);
//       buffer.writeln('  final $fieldName = \'${file.path}\';');
//     }
//   }
//   buffer.writeln('}');

//   // كتابة الكود إلى ملف داخل lib/gen/assets
//   final outputDir = Directory('lib/gen/assets');
//   if (!outputDir.existsSync()) {
//     outputDir.createSync(recursive: true);
//   }

//   final outputFile = File('lib/gen/assets/generated_assets.dart');
//   outputFile.writeAsStringSync(buffer.toString());
//   print('Generated assets code successfully at: ${outputFile.path}');
// }

// /// دالة لتحويل النصوص إلى تنسيق camelCase
// String toCamelCase(String input) {
//   // إزالة الامتداد
//   final nameWithoutExtension = input.replaceAll(RegExp(r'\.[^.]+$'), '');
//   // تقسيم النص بناءً على الرموز غير الصالحة مثل (_) أو (-)
//   final parts = nameWithoutExtension.split(RegExp(r'[^a-zA-Z0-9]'));
//   // تحويل كل جزء إلى حالة العنوان (Title Case) ثم دمجه مع الحفاظ على تنسيق CamelCase
//   final pascalCase = parts
//       .map((part) => part[0].toUpperCase() + part.substring(1).toLowerCase())
//       .join();
//   // تحويل الحرف الأول إلى حالة صغيرة للحصول على تنسيق camelCase
//   return pascalCase[0].toLowerCase() + pascalCase.substring(1);
// }
// // lib/core/utils/assets_generator.dart
// // dart run lib/core/utils/assets_generator.dart
// import 'dart:io';

// void main() {
//   // قراءة الموارد من مجلد assets (خارج lib)
//   final fontsDir = Directory('assets/fonts');
//   final iconsDir = Directory('assets/images');
//   final langsDir = Directory('assets/translations');

//   // توليد كود Dart
//   final buffer = StringBuffer();

//   buffer.writeln('// GENERATED CODE - DO NOT MODIFY BY HAND');
//   buffer.writeln('');
//   buffer.writeln('class Assets {');
//   buffer.writeln('  Assets._();');
//   buffer.writeln('');
//   buffer.writeln('  static const fonts = _AssetsFonts._();');
//   buffer.writeln('  static const icons = _AssetsIcons._();');
//   buffer.writeln('  static const langs = _AssetsLangs._();');
//   buffer.writeln('}');
//   buffer.writeln('');

//   // توليد فئة الخطوط
//   buffer.writeln('class _AssetsFonts {');
//   buffer.writeln('  const _AssetsFonts._();'); // تعريف الـ constructor كـ const
//   for (final file in fontsDir.listSync()) {
//     if (file is File) {
//       final fileName = file.path.split('/').last;
//       final fieldName = toCamelCase(fileName);
//       buffer.writeln('  static const $fieldName = \'${file.path}\';');
//     }
//   }
//   buffer.writeln('}');
//   buffer.writeln('');

//   // توليد فئة الأيقونات
//   buffer.writeln('class _AssetsIcons {');
//   buffer.writeln('  const _AssetsIcons._();'); // تعريف الـ constructor كـ const
//   for (final file in iconsDir.listSync()) {
//     if (file is File) {
//       final fileName = file.path.split('/').last;
//       final fieldName = toCamelCase(fileName);
//       buffer.writeln('  static const $fieldName = \'${file.path}\';');
//     }
//   }
//   buffer.writeln('}');
//   buffer.writeln('');

//   // توليد فئة اللغات
//   buffer.writeln('class _AssetsLangs {');
//   buffer.writeln('  const _AssetsLangs._();'); // تعريف الـ constructor كـ const
//   for (final file in langsDir.listSync()) {
//     if (file is File) {
//       final fileName = file.path.split('/').last;
//       final fieldName = toCamelCase(fileName);
//       buffer.writeln('  static const $fieldName = \'${file.path}\';');
//     }
//   }
//   buffer.writeln('}');

//   // كتابة الكود إلى ملف داخل lib/gen/assets
//   final outputDir = Directory('lib/gen/assets');
//   if (!outputDir.existsSync()) {
//     outputDir.createSync(recursive: true);
//   }

//   final outputFile = File('lib/gen/assets/generated_assets.dart');
//   outputFile.writeAsStringSync(buffer.toString());
//   print('Generated assets code successfully at: ${outputFile.path}');
// }

// /// دالة لتحويل النصوص إلى تنسيق camelCase
// String toCamelCase(String input) {
//   // إزالة الامتداد
//   final nameWithoutExtension = input.replaceAll(RegExp(r'\.[^.]+$'), '');
//   // تقسيم النص بناءً على الرموز غير الصالحة مثل (_) أو (-)
//   final parts = nameWithoutExtension.split(RegExp(r'[^a-zA-Z0-9]'));
//   // تحويل كل جزء إلى حالة العنوان (Title Case) ثم دمجه مع الحفاظ على تنسيق CamelCase
//   final pascalCase = parts
//       .map((part) => part[0].toUpperCase() + part.substring(1).toLowerCase())
//       .join();
//   // تحويل الحرف الأول إلى حالة صغيرة للحصول على تنسيق camelCase
//   return pascalCase[0].toLowerCase() + pascalCase.substring(1);
// }
// // lib/core/utils/assets_generator.dart
// // dart run lib/core/utils/assets_generator.dart
// import 'dart:io';

// void main() {
//   // قراءة الموارد من مجلد assets (خارج lib)
//   final fontsDir = Directory('assets/fonts');
//   final iconsDir = Directory('assets/images');
//   final langsDir = Directory('assets/translations');

//   // توليد كود Dart
//   final buffer = StringBuffer();

//   buffer.writeln('// GENERATED CODE - DO NOT MODIFY BY HAND');
//   buffer.writeln('');
//   buffer.writeln('class Assets {');
//   buffer.writeln('  Assets._();');
//   buffer.writeln('');
//   buffer.writeln('  static const fonts = _AssetsFonts._();');
//   buffer.writeln('  static const icons = _AssetsIcons._();');
//   buffer.writeln('  static const langs = _AssetsLangs._();');
//   buffer.writeln('}');
//   buffer.writeln('');

//   // توليد فئة الخطوط
//   buffer.writeln('class _AssetsFonts {');
//   buffer.writeln('  _AssetsFonts._();');
//   for (final file in fontsDir.listSync()) {
//     if (file is File) {
//       final fileName = file.path.split('/').last;
//       final fieldName = toCamelCase(fileName);
//       buffer.writeln('  static const $fieldName = \'${file.path}\';');
//     }
//   }
//   buffer.writeln('}');
//   buffer.writeln('');

//   // توليد فئة الأيقونات
//   buffer.writeln('class _AssetsIcons {');
//   buffer.writeln('  _AssetsIcons._();');
//   for (final file in iconsDir.listSync()) {
//     if (file is File) {
//       final fileName = file.path.split('/').last;
//       final fieldName = toCamelCase(fileName);
//       buffer.writeln('  static const $fieldName = \'${file.path}\';');
//     }
//   }
//   buffer.writeln('}');
//   buffer.writeln('');

//   // توليد فئة اللغات
//   buffer.writeln('class _AssetsLangs {');
//   buffer.writeln('  _AssetsLangs._();');
//   for (final file in langsDir.listSync()) {
//     if (file is File) {
//       final fileName = file.path.split('/').last;
//       final fieldName = toCamelCase(fileName);
//       buffer.writeln('  static const $fieldName = \'${file.path}\';');
//     }
//   }
//   buffer.writeln('}');

//   // كتابة الكود إلى ملف داخل lib/gen/assets
//   final outputDir = Directory('lib/gen/assets');
//   if (!outputDir.existsSync()) {
//     outputDir.createSync(recursive: true);
//   }

//   final outputFile = File('lib/gen/assets/generated_assets.dart');
//   outputFile.writeAsStringSync(buffer.toString());
//   print('Generated assets code successfully at: ${outputFile.path}');
// }

// /// دالة لتحويل النصوص إلى تنسيق camelCase
// String toCamelCase(String input) {
//   // إزالة الامتداد
//   final nameWithoutExtension = input.replaceAll(RegExp(r'\.[^.]+$'), '');
//   // تقسيم النص بناءً على الرموز غير الصالحة مثل (_) أو (-)
//   final parts = nameWithoutExtension.split(RegExp(r'[^a-zA-Z0-9]'));
//   // تحويل كل جزء إلى حالة العنوان (Title Case) ثم دمجه مع الحفاظ على تنسيق CamelCase
//   final pascalCase = parts
//       .map((part) => part[0].toUpperCase() + part.substring(1).toLowerCase())
//       .join();
//   // تحويل الحرف الأول إلى حالة صغيرة للحصول على تنسيق camelCase
//   return pascalCase[0].toLowerCase() + pascalCase.substring(1);
// }

// lib/core/utils/assets_generator.dart
// dart run lib/core/utils/assets_generator.dart
// import 'dart:io';

// void main() {
//   // قراءة الموارد من مجلد assets (خارج lib)
//   final fontsDir = Directory('assets/fonts');
//   final iconsDir = Directory('assets/images');
//   final langsDir = Directory('assets/translations');

//   // توليد كود Dart
//   final buffer = StringBuffer();

//   buffer.writeln('// GENERATED CODE - DO NOT MODIFY BY HAND');
//   buffer.writeln('');
//   buffer.writeln('class Assets {');
//   buffer.writeln('  Assets._();');
//   buffer.writeln('');
//   buffer.writeln('  static final fonts = _AssetsFonts._();');
//   buffer.writeln('  static final icons = _AssetsIcons._();');
//   buffer.writeln('  static final langs = _AssetsLangs._();');
//   buffer.writeln('}');
//   buffer.writeln('');

//   // توليد فئة الخطوط
//   buffer.writeln('class _AssetsFonts {');
//   buffer.writeln('  _AssetsFonts._();');
//   for (final file in fontsDir.listSync()) {
//     if (file is File) {
//       final fileName = file.path.split('/').last;
//       final fieldName = toCamelCase(fileName);
//       buffer.writeln('  final $fieldName = \'${file.path}\';');
//     }
//   }
//   buffer.writeln('}');
//   buffer.writeln('');

//   // توليد فئة الأيقونات
//   buffer.writeln('class _AssetsIcons {');
//   buffer.writeln('  _AssetsIcons._();');
//   for (final file in iconsDir.listSync()) {
//     if (file is File) {
//       final fileName = file.path.split('/').last;
//       final fieldName = toCamelCase(fileName);
//       buffer.writeln('  final $fieldName = \'${file.path}\';');
//     }
//   }
//   buffer.writeln('}');
//   buffer.writeln('');

//   // توليد فئة اللغات
//   buffer.writeln('class _AssetsLangs {');
//   buffer.writeln('  _AssetsLangs._();');
//   for (final file in langsDir.listSync()) {
//     if (file is File) {
//       final fileName = file.path.split('/').last;
//       final fieldName = toCamelCase(fileName);
//       buffer.writeln('  final $fieldName = \'${file.path}\';');
//     }
//   }
//   buffer.writeln('}');

//   // كتابة الكود إلى ملف داخل lib/gen/assets
//   final outputDir = Directory('lib/gen/assets');
//   if (!outputDir.existsSync()) {
//     outputDir.createSync(recursive: true);
//   }

//   final outputFile = File('lib/gen/assets/generated_assets.dart');
//   outputFile.writeAsStringSync(buffer.toString());
//   print('Generated assets code successfully at: ${outputFile.path}');
// }

// /// دالة لتحويل النصوص إلى تنسيق camelCase
// String toCamelCase(String input) {
//   // إزالة الامتداد
//   final nameWithoutExtension = input.replaceAll(RegExp(r'\.[^.]+$'), '');
//   // تقسيم النص بناءً على الرموز غير الصالحة مثل (_) أو (-)
//   final parts = nameWithoutExtension.split(RegExp(r'[^a-zA-Z0-9]'));
//   // تحويل كل جزء إلى حالة العنوان (Title Case) ثم دمجه مع الحفاظ على تنسيق CamelCase
//   final pascalCase = parts
//       .map((part) => part[0].toUpperCase() + part.substring(1).toLowerCase())
//       .join();
//   // تحويل الحرف الأول إلى حالة صغيرة للحصول على تنسيق camelCase
//   return pascalCase[0].toLowerCase() + pascalCase.substring(1);
// }
// /// دالة لتحويل النصوص إلى تنسيق CamelCase
// String toCamelCase(String input) {
//   // إزالة الامتداد
//   final nameWithoutExtension = input.replaceAll(RegExp(r'\.[^.]+$'), '');
//   // تقسيم النص بناءً على الرموز غير الصالحة مثل (_) أو (-)
//   final parts = nameWithoutExtension.split(RegExp(r'[^a-zA-Z0-9]'));
//   // تحويل كل جزء إلى حالة العنوان (Title Case) ثم دمجه مع الحفاظ على تنسيق CamelCase
//   final camelCase = parts
//       .map((part) => part[0].toUpperCase() + part.substring(1).toLowerCase())
//       .join();
//   return camelCase;
// }

// // lib/core/utils/assets_generator.dart
// // dart run lib/core/utils/assets_generator.dart
// import 'dart:io';

// void main() {
//   // قراءة الموارد من مجلد assets (خارج lib)
//   final fontsDir = Directory('assets/fonts');
//   final iconsDir = Directory('assets/images');
//   final langsDir = Directory('assets/translations');

//   // توليد كود Dart
//   final buffer = StringBuffer();

//   buffer.writeln('// GENERATED CODE - DO NOT MODIFY BY HAND');
//   buffer.writeln('');
//   buffer.writeln('class Assets {');
//   buffer.writeln('  Assets._();');
//   buffer.writeln('');
//   buffer.writeln('  static final fonts = _AssetsFonts._();');
//   buffer.writeln('  static final icons = _AssetsIcons._();');
//   buffer.writeln('  static final langs = _AssetsLangs._();');
//   buffer.writeln('}');
//   buffer.writeln('');

//   // توليد فئة الخطوط
//   buffer.writeln('class _AssetsFonts {');
//   buffer.writeln('  _AssetsFonts._();');
//   for (final file in fontsDir.listSync()) {
//     if (file is File) {
//       final fileName = file.path.split('/').last;
//       final fieldName = fileName
//           .replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_') // إزالة الرموز غير الصالحة
//           .replaceAll(RegExp(r'\.[^.]+$'), '') // إزالة الامتداد
//           .toLowerCase();
//       buffer.writeln('  final $fieldName = \'${file.path}\';');
//     }
//   }
//   buffer.writeln('}');
//   buffer.writeln('');

//   // توليد فئة الأيقونات
//   buffer.writeln('class _AssetsIcons {');
//   buffer.writeln('  _AssetsIcons._();');
//   for (final file in iconsDir.listSync()) {
//     if (file is File) {
//       final fileName = file.path.split('/').last;
//       final fieldName = fileName
//           .replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_') // إزالة الرموز غير الصالحة
//           .replaceAll(RegExp(r'\.[^.]+$'), '') // إزالة الامتداد
//           .toLowerCase();
//       buffer.writeln('  final $fieldName = \'${file.path}\';');
//     }
//   }
//   buffer.writeln('}');
//   buffer.writeln('');

//   // توليد فئة اللغات
//   buffer.writeln('class _AssetsLangs {');
//   buffer.writeln('  _AssetsLangs._();');
//   for (final file in langsDir.listSync()) {
//     if (file is File) {
//       final fileName = file.path.split('/').last;
//       final fieldName = fileName
//           .replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_') // إزالة الرموز غير الصالحة
//           .replaceAll(RegExp(r'\.[^.]+$'), '') // إزالة الامتداد
//           .toLowerCase();
//       buffer.writeln('  final $fieldName = \'${file.path}\';');
//     }
//   }
//   buffer.writeln('}');

//   // كتابة الكود إلى ملف داخل lib/gen/assets
//   final outputDir = Directory('lib/gen/assets');
//   if (!outputDir.existsSync()) {
//     outputDir.createSync(recursive: true);
//   }

//   final outputFile = File('lib/gen/assets/generated_assets.dart');
//   outputFile.writeAsStringSync(buffer.toString());
//   print('Generated assets code successfully at: ${outputFile.path}');
// }
// // بعد تشغيل هذا السكربت، يمكنك استخدام الكود المولد في تطبيقك كالتالي:
