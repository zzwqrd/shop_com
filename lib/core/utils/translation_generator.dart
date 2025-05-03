// lib/core/utils/translation_generator.dart
// dart run lib/core/utils/translation_generator.dart
import 'dart:convert';
import 'dart:io';

void main() {
  // قراءة ملفات الترجمات من مجلد assets/translations
  final langsDir = Directory('assets/translations');

  // توليد كود Dart
  final buffer = StringBuffer();

  // توليد كلاس LocaleKeys
  generateLocaleKeysClass(buffer, langsDir);

  // كتابة الكود إلى ملف داخل lib/gen/translations
  final outputDir = Directory('lib/gen/translations');
  if (!outputDir.existsSync()) {
    outputDir.createSync(recursive: true);
  }

  final outputFile = File('lib/gen/translations/locale_keys.dart');
  outputFile.writeAsStringSync(buffer.toString());
  print('Generated locale keys successfully at: ${outputFile.path}');
}

/// توليد كلاس LocaleKeys
void generateLocaleKeysClass(StringBuffer buffer, Directory langsDir) {
  buffer.writeln('// GENERATED CODE - DO NOT MODIFY BY HAND');
  buffer.writeln('// ignore_for_file: constant_identifier_names');
  buffer.writeln('');
  buffer.writeln('abstract class LocaleKeys {');
  buffer.writeln('  LocaleKeys._();');

  // جمع جميع المفاتيح من ملفات JSON
  final allKeys = <String>{};
  for (final file in langsDir.listSync()) {
    if (file is File && file.path.endsWith('.json')) {
      final jsonString = file.readAsStringSync();
      final Map<dynamic, dynamic> translations = json.decode(jsonString);
      allKeys.addAll(extractKeys(translations.cast<String, dynamic>()));
    }
  }

  // ترتيب المفاتيح أبجديًا لتحسين التنظيم
  final sortedKeys = allKeys.toList()..sort();

  // توليد الحقول الثابتة لكل مفتاح
  for (final key in sortedKeys) {
    final fieldName = key.replaceAll('.', '_'); // استبدال النقاط بـ underscores
    buffer.writeln('  static const $fieldName = \'$key\';');
  }

  buffer.writeln('}');
  buffer.writeln('');
}

/// استخراج جميع المفاتيح من ملف JSON (بما في ذلك المفاتيح المتداخلة)
Set<String> extractKeys(Map<String, dynamic> map, [String? parentKey]) {
  final keys = <String>{};
  map.forEach((key, value) {
    final fullKey = parentKey != null ? '$parentKey.$key' : key;
    if (value is Map) {
      // استدعاء دالة استخراج المفاتيح بشكل متكرر للخرائط الفرعية
      keys.addAll(extractKeys(value.cast<String, dynamic>(), fullKey));
    } else {
      keys.add(fullKey);
    }
  });
  return keys;
}
