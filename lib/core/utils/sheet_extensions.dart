import 'package:flutter/material.dart';

import '../../commonWidget/select_item.dart';

extension ShowSheetExtension on BuildContext {
  /// Show a bottom sheet for selecting a single item
  Future<dynamic> showSelectItemSheet({
    required String title,
    required List items,
    dynamic initItem,
    bool withImage = false,
  }) async {
    return showModalBottomSheet(
      context: this,
      isScrollControlled: true,
      builder: (context) => SelectItemSheet(
        title: title,
        items: items,
        initItem: initItem,
        withImage: withImage,
      ),
    );
  }

  /// Show a bottom sheet for selecting multiple items
  Future<List?> showSelectMultiItemSheet({
    required String title,
    required List items,
    List initItems = const [],
    bool withImage = false,
  }) async {
    return showModalBottomSheet(
      context: this,
      isScrollControlled: true,
      builder: (context) => SelectMultiItemSheet(
        title: title,
        items: items,
        initItems: initItems,
        withImage: withImage,
      ),
    );
  }
}
