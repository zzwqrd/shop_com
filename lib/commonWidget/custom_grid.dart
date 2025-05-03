import 'package:flutter/material.dart';

class EnhancedGridView extends StatelessWidget {
  /// A builder function to create grid items.
  final Widget Function(BuildContext context, int index) itemBuilder;

  /// The total number of items in the grid.
  final int itemCount;

  /// The number of columns in the grid.
  final int crossAxisCount;

  /// Padding for each grid item.
  final EdgeInsetsGeometry? itemPadding;

  /// Padding for the entire grid.
  final EdgeInsetsGeometry? gridPadding;

  /// Whether the grid should take up minimal space.
  final bool shrinkWrap;

  /// Scroll physics for the grid.
  final ScrollPhysics? scrollPhysics;

  const EnhancedGridView({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    required this.crossAxisCount,
    this.itemPadding,
    this.gridPadding,
    this.shrinkWrap = false,
    this.scrollPhysics,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: shrinkWrap,
      physics: scrollPhysics,
      padding: gridPadding ?? EdgeInsets.zero,
      itemCount: ((itemCount / crossAxisCount).ceil()),
      itemBuilder: (context, rowIndex) => _buildRow(context, rowIndex),
    );
  }

  /// Builds a single row of the grid.
  Widget _buildRow(BuildContext context, int rowIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        crossAxisCount,
        (columnIndex) {
          final itemIndex = (rowIndex * crossAxisCount) + columnIndex;
          return Expanded(
            child: itemIndex >= itemCount
                ? const SizedBox.shrink()
                : Padding(
                    padding: itemPadding ?? EdgeInsets.zero,
                    child: itemBuilder(context, itemIndex),
                  ),
          );
        },
      ),
    );
  }
}

extension GridExtension on int {
  /// Creates a grid layout with a specified number of rows and columns.
  List<Widget> generateGrid({
    required Widget Function(int index) itemBuilder,
    required int itemCount,
    required int crossAxisCount,
    EdgeInsetsGeometry? itemPadding,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.spaceBetween,
  }) {
    return List.generate((itemCount / crossAxisCount).ceil(), (rowIndex) {
      return Row(
        mainAxisAlignment: mainAxisAlignment,
        children: List.generate(
          crossAxisCount,
          (columnIndex) {
            final itemIndex = (rowIndex * crossAxisCount) + columnIndex;
            return Expanded(
              child: itemIndex >= itemCount
                  ? const SizedBox.shrink()
                  : Padding(
                      padding: itemPadding ?? EdgeInsets.zero,
                      child: itemBuilder(itemIndex),
                    ),
            );
          },
        ),
      );
    });
  }
}
