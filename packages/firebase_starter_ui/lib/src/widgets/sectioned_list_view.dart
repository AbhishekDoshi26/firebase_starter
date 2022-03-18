import 'package:flutter/material.dart';

/// Typedef to used to build items in the list view
typedef ItemWidgetBuilder<T> = Widget Function(BuildContext context, T value);

/// {@template FSSectionedListView}
/// A Firebase Starter Sectioned List view.
///
/// ```dart
/// FSSectionedListView(
///   sections: sections,
///   itemBuilder: (context, item) => item,
/// )
/// ```
/// {@endtemplate}
class FSSectionedListView<T> extends StatelessWidget {
  /// {@macro FSSectionedListView}

  const FSSectionedListView({
    required this.sections,
    required this.itemBuilder,
    this.separated = false,
    this.padding,
    this.controller,
    Key? key,
  }) : super(key: key);

  /// A list of [Section]s to be displayed. Use [Section.withHeading] function
  /// display a section with heading tile.
  final List<Section<T>> sections;

  /// A builder specifically for the items in the section. Use the function
  /// signature [ItemWidgetBuilder].
  final ItemWidgetBuilder<T?> itemBuilder;

  /// Boolean to show a separator between sections
  final bool separated;

  /// A controller of type [ScrollController] used to manage scrolling
  final ScrollController? controller;

  /// Used to provide custom padding to the sections
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final flattened = <Object?>[];

    for (final section in sections) {
      if (section._hasHeading) {
        flattened.add(_SectionHeading(section._header));
      }
      flattened.addAll(section.values);
    }

    Widget? titleAndItemBuilder(context, i) => flattened[i] is _SectionHeading
        ? flattened[i] as Widget?
        : itemBuilder(context, flattened[i] as T?);

    return separated
        ? ListView.separated(
            padding: padding,
            controller: controller,
            itemBuilder:
                titleAndItemBuilder as Widget Function(BuildContext, int),
            separatorBuilder: (context, i) => const Divider(),
            itemCount: flattened.length,
          )
        : ListView.builder(
            padding: padding,
            controller: controller,
            itemBuilder:
                titleAndItemBuilder as Widget Function(BuildContext, int),
            itemCount: flattened.length,
          );
  }
}

/// {@template Section}
/// A Firebase Starter utility class to define a section in the list view.
///
/// ```dart
/// Section.withHeading(
///   Text('Heading'),
///   [
///     Text('Body')
///   ],
///   asListTile: false,
/// )
/// ```
/// {@endtemplate}
class Section<T> {
  /// {@macro Section}
  Section({Widget? heading, this.label, this.values = const []})
      : _heading = heading;

  /// Constructor to show only body of a section without header
  Section.untitled(List<T> values) : this(values: values);

  /// Show labeled section that takes in a [String] named [label]
  Section.labeled(String label, List<T> values)
      : this(label: label, values: values);

  /// Shows only the label without a section body
  Section.labelOnly(String label, {Widget? child})
      : this.headingOnly(
          _DefaultSectionHeading.text(label),
          child: child,
        );

  /// Shows only the header without the body of the section.
  /// Conditionally uses [ListTile] when [asListTile] is true
  Section.headingOnly(Widget heading, {Widget? child, bool asListTile = true})
      : this.withHeading(
            child == null
                ? heading
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      heading,
                      child,
                    ],
                  ),
            [],
            asListTile: asListTile);

  /// Show a section with header and list of values that will be return in
  /// itemBuilder
  Section.withHeading(Widget heading, List<T> values, {bool asListTile = true})
      : this(
            heading: asListTile ? _asListTile(heading) : heading,
            values: values);

  final Widget? _heading;

  /// These are list of values that is provided as the second argument in the
  /// itemBuilder to be used to build the section items
  final List<T> values;

  /// Used to show a label for a section
  final String? label;

  bool get _hasHeading {
    return _heading != null || label != null;
  }

  Widget? get _header {
    if (_heading != null) {
      return _heading;
    } else {
      return _asListTile(_DefaultSectionHeading.text(label!));
    }
  }

  static ListTile _asListTile(Widget child) =>
      ListTile(dense: true, title: child);
}

class _SectionHeading extends StatelessWidget {
  const _SectionHeading(this.child);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return child!;
  }
}

class _DefaultSectionHeading extends StatelessWidget {
  const _DefaultSectionHeading({Key? key, required this.child})
      : super(key: key);

  _DefaultSectionHeading.text(String text, {Key? key})
      : this(
          child: Text(text),
          key: key,
        );

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      child: child,
      style: Theme.of(context).textTheme.caption,
    );
  }
}
