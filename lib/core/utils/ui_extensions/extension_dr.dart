import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Comprehensive DropdownButton Extensions for Flutter
extension DropdownExtensions<T> on DropdownButton<T> {
  // Styling Extensions
  DropdownButton<T> withStyle({
    TextStyle? style,
    Color? dropdownColor,
    Color? focusColor,
    dynamic? elevation,
    double? menuMaxHeight,
    bool? enableFeedback,
    BorderRadius? borderRadius,
  }) =>
      DropdownButton<T>(
        key: key,
        items: items,
        selectedItemBuilder: selectedItemBuilder,
        value: value,
        hint: hint,
        disabledHint: disabledHint,
        onChanged: onChanged,
        onTap: onTap,
        elevation: elevation ?? this.elevation,
        style: style ?? this.style,
        underline: underline,
        icon: icon,
        iconDisabledColor: iconDisabledColor,
        iconEnabledColor: iconEnabledColor,
        iconSize: iconSize,
        isDense: isDense,
        isExpanded: isExpanded,
        itemHeight: itemHeight,
        focusColor: focusColor ?? this.focusColor,
        focusNode: focusNode,
        autofocus: autofocus,
        dropdownColor: dropdownColor ?? this.dropdownColor,
        menuMaxHeight: menuMaxHeight ?? this.menuMaxHeight,
        enableFeedback: enableFeedback ?? this.enableFeedback,
        alignment: alignment,
        borderRadius: borderRadius ?? this.borderRadius,
      );

  // Size Variations
  DropdownButton<T> get expanded => DropdownButton<T>(
        key: key,
        items: items,
        selectedItemBuilder: selectedItemBuilder,
        value: value,
        hint: hint,
        disabledHint: disabledHint,
        onChanged: onChanged,
        onTap: onTap,
        elevation: elevation,
        style: style,
        underline: underline,
        icon: icon,
        iconDisabledColor: iconDisabledColor,
        iconEnabledColor: iconEnabledColor,
        iconSize: iconSize,
        isDense: isDense,
        isExpanded: true,
        itemHeight: itemHeight,
        focusColor: focusColor,
        focusNode: focusNode,
        autofocus: autofocus,
        dropdownColor: dropdownColor,
        menuMaxHeight: menuMaxHeight,
        enableFeedback: enableFeedback,
        alignment: alignment,
        borderRadius: borderRadius,
      );

  DropdownButton<T> get dense => DropdownButton<T>(
        key: key,
        items: items,
        selectedItemBuilder: selectedItemBuilder,
        value: value,
        hint: hint,
        disabledHint: disabledHint,
        onChanged: onChanged,
        onTap: onTap,
        elevation: elevation,
        style: style,
        underline: underline,
        icon: icon,
        iconDisabledColor: iconDisabledColor,
        iconEnabledColor: iconEnabledColor,
        iconSize: iconSize,
        isDense: true,
        isExpanded: isExpanded,
        itemHeight: itemHeight,
        focusColor: focusColor,
        focusNode: focusNode,
        autofocus: autofocus,
        dropdownColor: dropdownColor,
        menuMaxHeight: menuMaxHeight,
        enableFeedback: enableFeedback,
        alignment: alignment,
        borderRadius: borderRadius,
      );

  // Border Styles
  DropdownButton<T> get outlined => DropdownButton<T>(
        key: key,
        items: items,
        selectedItemBuilder: selectedItemBuilder,
        value: value,
        hint: hint,
        disabledHint: disabledHint,
        onChanged: onChanged,
        onTap: onTap,
        elevation: elevation,
        style: style,
        underline: Container(
          height: 2,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        icon: icon,
        iconDisabledColor: iconDisabledColor,
        iconEnabledColor: iconEnabledColor,
        iconSize: iconSize,
        isDense: isDense,
        isExpanded: isExpanded,
        itemHeight: itemHeight,
        focusColor: focusColor,
        focusNode: focusNode,
        autofocus: autofocus,
        dropdownColor: dropdownColor,
        menuMaxHeight: menuMaxHeight,
        enableFeedback: enableFeedback,
        alignment: alignment,
        borderRadius: borderRadius,
      );

  DropdownButton<T> get underlined => DropdownButton<T>(
        key: key,
        items: items,
        selectedItemBuilder: selectedItemBuilder,
        value: value,
        hint: hint,
        disabledHint: disabledHint,
        onChanged: onChanged,
        onTap: onTap,
        elevation: elevation,
        style: style,
        underline: Container(
          height: 2,
          color: Colors.grey,
        ),
        icon: icon,
        iconDisabledColor: iconDisabledColor,
        iconEnabledColor: iconEnabledColor,
        iconSize: iconSize,
        isDense: isDense,
        isExpanded: isExpanded,
        itemHeight: itemHeight,
        focusColor: focusColor,
        focusNode: focusNode,
        autofocus: autofocus,
        dropdownColor: dropdownColor,
        menuMaxHeight: menuMaxHeight,
        enableFeedback: enableFeedback,
        alignment: alignment,
        borderRadius: borderRadius,
      );

  DropdownButton<T> get noUnderline => DropdownButton<T>(
        key: key,
        items: items,
        selectedItemBuilder: selectedItemBuilder,
        value: value,
        hint: hint,
        disabledHint: disabledHint,
        onChanged: onChanged,
        onTap: onTap,
        elevation: elevation,
        style: style,
        underline: const SizedBox.shrink(),
        icon: icon,
        iconDisabledColor: iconDisabledColor,
        iconEnabledColor: iconEnabledColor,
        iconSize: iconSize,
        isDense: isDense,
        isExpanded: isExpanded,
        itemHeight: itemHeight,
        focusColor: focusColor,
        focusNode: focusNode,
        autofocus: autofocus,
        dropdownColor: dropdownColor,
        menuMaxHeight: menuMaxHeight,
        enableFeedback: enableFeedback,
        alignment: alignment,
        borderRadius: borderRadius,
      );

  // Icon Variations
  DropdownButton<T> withIcon(Widget icon) => DropdownButton<T>(
        key: key,
        items: items,
        selectedItemBuilder: selectedItemBuilder,
        value: value,
        hint: hint,
        disabledHint: disabledHint,
        onChanged: onChanged,
        onTap: onTap,
        elevation: elevation,
        style: style,
        underline: underline,
        icon: icon,
        iconDisabledColor: iconDisabledColor,
        iconEnabledColor: iconEnabledColor,
        iconSize: iconSize,
        isDense: isDense,
        isExpanded: isExpanded,
        itemHeight: itemHeight,
        focusColor: focusColor,
        focusNode: focusNode,
        autofocus: autofocus,
        dropdownColor: dropdownColor,
        menuMaxHeight: menuMaxHeight,
        enableFeedback: enableFeedback,
        alignment: alignment,
        borderRadius: borderRadius,
      );

  DropdownButton<T> get noIcon => withIcon(const SizedBox.shrink());
}

/// Custom Dropdown Builder Class
class CustomDropdown {
  /// Simple dropdown with basic configuration
  static Widget simple<T>({
    Key? key,
    required List<T> items,
    required String Function(T) itemAsString,
    T? selectedItem,
    required ValueChanged<T?> onChanged,
    String? hintText,
    Widget? prefixIcon,
    bool isExpanded = true,
    InputDecoration? decoration,
    TextStyle? style,
    Color? dropdownColor,
    double? menuMaxHeight,
    bool enabled = true,
  }) {
    return DropdownButtonFormField<T>(
      key: key,
      value: selectedItem,
      items: items
          .map(
            (item) => DropdownMenuItem<T>(
              value: item,
              child: Text(itemAsString(item)),
            ),
          )
          .toList(),
      onChanged: enabled ? onChanged : null,
      decoration: decoration ??
          InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon,
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
          ),
      style: style,
      dropdownColor: dropdownColor,
      menuMaxHeight: menuMaxHeight,
      isExpanded: isExpanded,
    );
  }

  /// Advanced dropdown with search functionality
  static Widget searchable<T>({
    Key? key,
    required List<T> items,
    required String Function(T) itemAsString,
    T? selectedItem,
    required ValueChanged<T?> onChanged,
    String? hintText,
    String? searchHint = 'البحث...',
    Widget? prefixIcon,
    bool isExpanded = true,
    InputDecoration? decoration,
    TextStyle? style,
    Color? dropdownColor,
    double? menuMaxHeight,
    bool enabled = true,
    bool Function(T, String)? searchFilter,
  }) {
    return StatefulBuilder(
      builder: (context, setState) {
        List<T> filteredItems = items;
        final searchController = TextEditingController();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Field
            TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: searchHint,
                prefixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
              onChanged: (query) {
                setState(() {
                  if (query.isEmpty) {
                    filteredItems = items;
                  } else {
                    filteredItems = items.where((item) {
                      if (searchFilter != null) {
                        return searchFilter(item, query);
                      }
                      return itemAsString(item)
                          .toLowerCase()
                          .contains(query.toLowerCase());
                    }).toList();
                  }
                });
              },
            ),
            const SizedBox(height: 8),
            // Dropdown
            DropdownButtonFormField<T>(
              key: key,
              value: selectedItem,
              items: filteredItems
                  .map(
                    (item) => DropdownMenuItem<T>(
                      value: item,
                      child: Text(itemAsString(item)),
                    ),
                  )
                  .toList(),
              onChanged: enabled ? onChanged : null,
              decoration: decoration ??
                  InputDecoration(
                    hintText: hintText,
                    prefixIcon: prefixIcon,
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
              style: style,
              dropdownColor: dropdownColor,
              menuMaxHeight: menuMaxHeight,
              isExpanded: isExpanded,
            ),
          ],
        );
      },
    );
  }

  /// Multi-select dropdown
  static Widget multiSelect<T>({
    Key? key,
    required List<T> items,
    required String Function(T) itemAsString,
    List<T>? selectedItems,
    required ValueChanged<List<T>> onChanged,
    String? hintText = 'اختر عناصر',
    String? selectedItemsText,
    Widget? prefixIcon,
    bool isExpanded = true,
    InputDecoration? decoration,
    TextStyle? style,
    Color? dropdownColor,
    double? menuMaxHeight = 300,
    bool enabled = true,
    int? maxSelections,
  }) {
    selectedItems ??= [];

    return StatefulBuilder(
      builder: (context, setState) {
        return FormField<List<T>>(
          initialValue: selectedItems,
          builder: (field) {
            return InputDecorator(
              decoration: decoration ??
                  InputDecoration(
                    hintText: hintText,
                    prefixIcon: prefixIcon,
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
              child: InkWell(
                onTap: enabled
                    ? () => _showMultiSelectDialog<T>(
                          context: context,
                          items: items,
                          itemAsString: itemAsString,
                          selectedItems: selectedItems!,
                          onChanged: (newSelection) {
                            setState(() {
                              selectedItems!.clear();
                              selectedItems!.addAll(newSelection);
                              onChanged(selectedItems!);
                              field.didChange(selectedItems);
                            });
                          },
                          title: hintText ?? 'اختر عناصر',
                          maxSelections: maxSelections,
                        )
                    : null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        selectedItems!.isEmpty
                            ? (hintText ?? 'اختر عناصر')
                            : selectedItemsText ??
                                '${selectedItems!.length} عنصر محدد',
                        style: style ??
                            TextStyle(
                              color: selectedItems!.isEmpty
                                  ? Colors.grey[600]
                                  : null,
                            ),
                      ),
                    ),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  /// Country dropdown with flags
  static Widget country({
    Key? key,
    Country? selectedCountry,
    required ValueChanged<Country?> onChanged,
    String? hintText = 'اختر الدولة',
    Widget? prefixIcon,
    bool isExpanded = true,
    InputDecoration? decoration,
    bool showFlag = true,
    bool enabled = true,
  }) {
    return DropdownButtonFormField<Country>(
      key: key,
      value: selectedCountry,
      items: Countries.all
          .map(
            (country) => DropdownMenuItem<Country>(
              value: country,
              child: Row(
                children: [
                  if (showFlag) ...[
                    Text(country.flag, style: const TextStyle(fontSize: 20)),
                    const SizedBox(width: 8),
                  ],
                  Expanded(child: Text(country.name)),
                ],
              ),
            ),
          )
          .toList(),
      onChanged: enabled ? onChanged : null,
      decoration: decoration ??
          InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon,
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
          ),
      isExpanded: isExpanded,
    );
  }

  /// Custom styled dropdown
  static Widget styled<T>({
    Key? key,
    required List<T> items,
    required String Function(T) itemAsString,
    T? selectedItem,
    required ValueChanged<T?> onChanged,
    String? hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    Color? backgroundColor,
    Color? borderColor,
    double borderRadius = 8.0,
    double borderWidth = 1.0,
    EdgeInsetsGeometry? padding,
    TextStyle? style,
    TextStyle? hintStyle,
    Color? dropdownColor,
    double? menuMaxHeight,
    bool enabled = true,
    List<BoxShadow>? boxShadow,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor ?? Colors.grey,
          width: borderWidth,
        ),
        boxShadow: boxShadow,
      ),
      child: DropdownButtonFormField<T>(
        key: key,
        value: selectedItem,
        items: items
            .map(
              (item) => DropdownMenuItem<T>(
                value: item,
                child: Text(itemAsString(item)),
              ),
            )
            .toList(),
        onChanged: enabled ? onChanged : null,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          contentPadding: padding ??
              const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
        ),
        style: style,
        dropdownColor: dropdownColor,
        menuMaxHeight: menuMaxHeight,
        isExpanded: true,
      ),
    );
  }

  // Helper method for multi-select dialog
  static Future<void> _showMultiSelectDialog<T>({
    required BuildContext context,
    required List<T> items,
    required String Function(T) itemAsString,
    required List<T> selectedItems,
    required ValueChanged<List<T>> onChanged,
    required String title,
    int? maxSelections,
  }) async {
    final List<T> tempSelected = List.from(selectedItems);

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(title),
              content: SizedBox(
                width: double.maxFinite,
                height: 300,
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    final isSelected = tempSelected.contains(item);
                    final canSelect = maxSelections == null ||
                        tempSelected.length < maxSelections ||
                        isSelected;

                    return CheckboxListTile(
                      title: Text(itemAsString(item)),
                      value: isSelected,
                      onChanged: canSelect
                          ? (bool? value) {
                              setState(() {
                                if (value == true) {
                                  tempSelected.add(item);
                                } else {
                                  tempSelected.remove(item);
                                }
                              });
                            }
                          : null,
                    );
                  },
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('إلغاء'),
                ),
                TextButton(
                  onPressed: () {
                    onChanged(tempSelected);
                    Navigator.of(context).pop();
                  },
                  child: const Text('تأكيد'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

/// Dropdown Validation Helpers
class DropdownValidators {
  /// Required selection validator
  static String? Function(T?) required<T>([String? message]) {
    return (T? value) {
      if (value == null) {
        return message ?? 'يرجى الاختيار من القائمة';
      }
      return null;
    };
  }

  /// Multi-select required validator
  static String? Function(List<T>?) requiredMultiple<T>([String? message]) {
    return (List<T>? value) {
      if (value == null || value.isEmpty) {
        return message ?? 'يرجى اختيار عنصر واحد على الأقل';
      }
      return null;
    };
  }

  /// Minimum selections validator
  static String? Function(List<T>?) minSelections<T>(
    int min, [
    String? message,
  ]) {
    return (List<T>? value) {
      if (value == null || value.length < min) {
        return message ?? 'يرجى اختيار $min عناصر على الأقل';
      }
      return null;
    };
  }

  /// Maximum selections validator
  static String? Function(List<T>?) maxSelections<T>(
    int max, [
    String? message,
  ]) {
    return (List<T>? value) {
      if (value != null && value.length > max) {
        return message ?? 'لا يمكن اختيار أكثر من $max عناصر';
      }
      return null;
    };
  }
}

/// Predefined Data Models
class Country {
  final String code;
  final String name;
  final String flag;

  const Country({
    required this.code,
    required this.name,
    required this.flag,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Country &&
          runtimeType == other.runtimeType &&
          code == other.code;

  @override
  int get hashCode => code.hashCode;
}

class Countries {
  static const List<Country> all = [
    Country(code: 'EG', name: 'مصر', flag: '🇪🇬'),
    Country(code: 'SA', name: 'السعودية', flag: '🇸🇦'),
    Country(code: 'AE', name: 'الإمارات', flag: '🇦🇪'),
    Country(code: 'KW', name: 'الكويت', flag: '🇰🇼'),
    Country(code: 'QA', name: 'قطر', flag: '🇶🇦'),
    Country(code: 'BH', name: 'البحرين', flag: '🇧🇭'),
    Country(code: 'OM', name: 'عمان', flag: '🇴🇲'),
    Country(code: 'JO', name: 'الأردن', flag: '🇯🇴'),
    Country(code: 'LB', name: 'لبنان', flag: '🇱🇧'),
    Country(code: 'SY', name: 'سوريا', flag: '🇸🇾'),
    Country(code: 'IQ', name: 'العراق', flag: '🇮🇶'),
    Country(code: 'MA', name: 'المغرب', flag: '🇲🇦'),
    Country(code: 'TN', name: 'تونس', flag: '🇹🇳'),
    Country(code: 'DZ', name: 'الجزائر', flag: '🇩🇿'),
    Country(code: 'LY', name: 'ليبيا', flag: '🇱🇾'),
    Country(code: 'SD', name: 'السودان', flag: '🇸🇩'),
    Country(code: 'YE', name: 'اليمن', flag: '🇾🇪'),
    Country(code: 'PS', name: 'فلسطين', flag: '🇵🇸'),
    Country(code: 'US', name: 'الولايات المتحدة', flag: '🇺🇸'),
    Country(code: 'GB', name: 'بريطانيا', flag: '🇬🇧'),
    Country(code: 'DE', name: 'ألمانيا', flag: '🇩🇪'),
    Country(code: 'FR', name: 'فرنسا', flag: '🇫🇷'),
    Country(code: 'IT', name: 'إيطاليا', flag: '🇮🇹'),
    Country(code: 'ES', name: 'إسبانيا', flag: '🇪🇸'),
  ];

  static List<Country> get arab => all
      .where((c) => [
            'EG',
            'SA',
            'AE',
            'KW',
            'QA',
            'BH',
            'OM',
            'JO',
            'LB',
            'SY',
            'IQ',
            'MA',
            'TN',
            'DZ',
            'LY',
            'SD',
            'YE',
            'PS'
          ].contains(c.code))
      .toList();

  static List<Country> get gulf => all
      .where((c) => ['SA', 'AE', 'KW', 'QA', 'BH', 'OM'].contains(c.code))
      .toList();
}

/// Quick Dropdown Builders (Static Extensions)
extension QuickDropdowns on Never {
  /// Quick simple dropdown
  static Widget simple<T>(
    List<T> items,
    String Function(T) itemAsString, {
    T? value,
    ValueChanged<T?>? onChanged,
    String? hint,
  }) =>
      CustomDropdown.simple<T>(
        items: items,
        itemAsString: itemAsString,
        selectedItem: value,
        onChanged: onChanged ?? (_) {},
        hintText: hint,
      );

  /// Quick country dropdown
  static Widget country({
    Country? value,
    ValueChanged<Country?>? onChanged,
    String? hint = 'اختر الدولة',
  }) =>
      CustomDropdown.country(
        selectedCountry: value,
        onChanged: onChanged ?? (_) {},
        hintText: hint,
      );

  /// Quick multi-select dropdown
  static Widget multiSelect<T>(
    List<T> items,
    String Function(T) itemAsString, {
    List<T>? selectedItems,
    ValueChanged<List<T>>? onChanged,
    String? hint,
  }) =>
      CustomDropdown.multiSelect<T>(
        items: items,
        itemAsString: itemAsString,
        selectedItems: selectedItems,
        onChanged: onChanged ?? (_) {},
        hintText: hint,
      );
}
