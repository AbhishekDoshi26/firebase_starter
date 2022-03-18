import 'package:firebase_starter_ui/firebase_starter_ui.dart';
import 'package:flutter/material.dart';

/// {@template FSSpinner}
/// A Firebase Starter UI Circular Progress Indicator
///
/// A widget that shows progress along a circle.
///
///  * _Determinate_. Determinate progress indicators have a specific value at
///    each point in time, and the value should increase monotonically from 0.0
///    to 1.0, at which time the indicator is complete. To create a determinate
///    progress indicator, use a non-null [value] between 0.0 and 1.0.
///  * _Indeterminate_. Indeterminate progress indicators do not have a specific
///    value at each point in time and instead indicate that progress is being
///    made without indicating how much progress remains. To create an
///    indeterminate progress indicator, use a null [value].
///
/// {@endtemplate}
class FSSpinner extends StatelessWidget {
  /// {@macro FSSpinner}
  const FSSpinner({
    Key? key,
    this.color,
    this.text,
    this.strokeWidth,
    this.value,
  }) : super(key: key);

  /// The color of the indicator arc.
  final Color? color;

  /// An optional message to display below the indicator.
  final String? text;

  /// The width of the line used to draw the circle.
  final double? strokeWidth;

  /// A value between 0.0 and 1.0 to indicate determinate progress.
  final double? value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator(
          backgroundColor: FSColors.transparent,
          valueColor: AlwaysStoppedAnimation<Color>(
              color ?? theme.colorScheme.secondary),
          strokeWidth: strokeWidth ?? FSSpacing.s4,
          value: value,
        ),
        if (text != null) ...[
          const SizedBox(height: FSSpacing.s16),
          Text(text!),
        ],
      ],
    );
  }
}
