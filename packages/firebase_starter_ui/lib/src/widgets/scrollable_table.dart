import 'package:firebase_starter_ui/firebase_starter_ui.dart';
import 'package:flutter/material.dart';

/// Signature for a function that creates a widget for a given column header in
/// a table.
typedef TableHeaderWidgetBuilder = Widget Function(
  BuildContext context,
  int columnIndex,
);

/// Signature for a function that creates a widget for a given coordinate in a
/// table.
typedef TableCellWidgetBuilder = Widget Function(
  BuildContext context,
  int rowIndex,
  int columnIndex,
);

/// {@template scrollable_table}
/// A scrollable table with an optional sticky header.
/// {@endtemplate}
class FSScrollableTable extends StatefulWidget {
  /// {@macro scrollable_table}
  const FSScrollableTable({
    Key? key,
    this.controller,
    required this.columnCount,
    required this.rowCount,
    this.headerBuilder,
    required this.cellBuilder,
  })  : assert(columnCount > 0),
        assert(rowCount > 0),
        super(key: key);

  /// An optional [ScrollController] this [FSScrollableTable] will
  /// attach to.
  ///
  /// Note that this controller is only used for horizontal scrolling.
  ///
  /// Is optional and mostly used only for testing. If set to `null`, an
  /// internal [ScrollController] is used instead.
  final ScrollController? controller;

  /// The amount of columns the table contains.
  ///
  /// Must be more higher than `0` and cannot be `null`.
  final int columnCount;

  /// The amount of rows the table contains.
  ///
  /// Must be more higher than `0` and cannot be `null`.
  final int rowCount;

  /// An optional builder that can be used to build a sticky header row.
  final TableHeaderWidgetBuilder? headerBuilder;

  /// The builder used for building every cell in the table.
  ///
  /// Can be `null`.
  final TableCellWidgetBuilder cellBuilder;

  @override
  _FSScrollableTableState createState() => _FSScrollableTableState();
}

class _FSScrollableTableState extends State<FSScrollableTable> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.headerBuilder != null)
            Row(
              children: [
                for (var columnIndex = 0;
                    columnIndex < widget.columnCount;
                    columnIndex++)
                  widget.headerBuilder!(context, columnIndex),
              ],
            ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (var rowIndex = 0; rowIndex < widget.rowCount; rowIndex++)
                    Row(
                      children: [
                        for (var columnIndex = 0;
                            columnIndex < widget.columnCount;
                            columnIndex++)
                          widget.cellBuilder(context, rowIndex, columnIndex)
                      ],
                    ),
                  const SizedBox(
                    height: FSSpacing.s150,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
