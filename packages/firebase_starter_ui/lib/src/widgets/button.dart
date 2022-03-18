import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

/// {@template FSTextButton}
/// A Firebase Starter UI Text Button.
///
/// ```dart
/// FSTextButton(
///   onPressed: () {
///     print('Tapped!');
///   },
///   child: Text('Button'),
/// )
/// ```
/// {@endtemplate}
class FSTextButton extends TextButton {
  /// {@macro FSTextButton}
  const FSTextButton({
    Key? key,
    ButtonStyle? style,
    required VoidCallback? onPressed,
    required Widget child,
  }) : super(
          key: key,
          style: style,
          onPressed: onPressed,
          child: child,
        );

  /// Create a text button from a pair of widgets that serve as the button's
  /// [icon] and [label].
  ///
  /// The icon and label are arranged in a row
  /// (column if you set direction = Axis.vertical)
  /// and padded by 8 logical pixels at the ends,
  ///  with an 8 pixel gap in between.
  ///
  /// The [icon] and [label] arguments must not be null.
  FSTextButton.icon({
    Key? key,
    ButtonStyle? style,
    required VoidCallback onPressed,
    required Widget icon,
    required Widget label,
    Axis? direction,
  }) : super(
          key: key,
          style: style,
          onPressed: onPressed,
          child: _FSButtonWithIconChild(
            icon: icon,
            label: label,
            direction: direction,
          ),
        );
}

/// {@template FSIconButton}
/// A Firebase Starter UI Icon Button.
///
/// ```dart
/// FSIconButton(
///   icon: Icon(Icons.settings),
///   onPressed: () {
///     print('Tapped!');
///   },
/// )
/// ```
/// {@endtemplate}
class FSIconButton extends IconButton {
  /// {@macro FSIconButton}
  const FSIconButton({
    Key? key,
    required Widget icon,
    required VoidCallback onPressed,
  }) : super(
          key: key,
          onPressed: onPressed,
          icon: icon,
        );
}

/// {@template FSOutlinedButton}
/// A Firebase Starter UI Outlined Button.
///
/// A material button with an outlined border.
///
/// ```dart
/// FSOutlinedButton(
///   child: FlutterLogo(),
///   onPressed: () {
///     print('Tapped!');
///   },
/// )
/// ```
/// {@endtemplate}
class FSOutlinedButton extends OutlinedButton {
  /// {@macro FSOutlinedButton}
  const FSOutlinedButton({
    Key? key,
    ButtonStyle? style,
    required VoidCallback onPressed,
    required Widget child,
  }) : super(
          key: key,
          style: style,
          onPressed: onPressed,
          child: child,
        );

  /// Create an outlined button from a pair of widgets that serve as the
  /// button's [icon] and [label].
  ///
  /// The icon and label are arranged in a row
  /// (column if you set direction = Axis.vertical)
  /// and padded by 12 logical pixels at the start, and 16 at the end,
  /// with an 8 pixel gap in between.
  ///
  /// The [icon] and [label] arguments must not be null.
  FSOutlinedButton.icon({
    Key? key,
    ButtonStyle? style,
    required VoidCallback onPressed,
    required Widget icon,
    required Widget label,
    Axis? direction,
  }) : super(
          key: key,
          style: style,
          onPressed: onPressed,
          child: _FSButtonWithIconChild(
            icon: icon,
            label: label,
            direction: direction,
          ),
        );
}

/// {@template FSElevatedButton}
/// A Firebase Starter UI Elevated Button.
///
/// Use elevated buttons to add dimension to otherwise mostly flat
/// layouts, e.g.  in long busy lists of content, or in wide
/// spaces. Avoid using elevated buttons on already-elevated content
/// such as dialogs or cards.
///
/// ```dart
/// FSElevatedButton(
///   child: FlutterLogo(),
///   onPressed: () {
///     print('Tapped!');
///   },
/// )
/// ```
/// {@endtemplate}
class FSElevatedButton extends ElevatedButton {
  /// {@macro FSElevatedButton}
  const FSElevatedButton({
    Key? key,
    ButtonStyle? style,
    required VoidCallback onPressed,
    required Widget child,
  }) : super(
          key: key,
          style: style,
          onPressed: onPressed,
          child: child,
        );

  /// Create an elevated button from a pair of widgets that serve as the
  /// button's [icon] and [label].
  ///
  /// The icon and label are arranged in a row
  /// (column if you set direction = Axis.vertical)
  /// and padded by 12 logical pixel at the start, and 16 at the end,
  /// with an 8 pixel gap in between.
  ///
  /// The [icon] and [label] arguments must not be null.
  FSElevatedButton.icon({
    Key? key,
    ButtonStyle? style,
    required VoidCallback onPressed,
    required Widget icon,
    required Widget label,
    Axis? direction,
  }) : super(
          key: key,
          style: style,
          onPressed: onPressed,
          child: _FSButtonWithIconChild(
            icon: icon,
            label: label,
            direction: direction,
          ),
        );
}

class _FSButtonWithIconChild extends StatelessWidget {
  const _FSButtonWithIconChild({
    Key? key,
    this.label,
    this.icon,
    Axis? direction,
  })  : _direction = direction ?? Axis.horizontal,
        super(key: key);

  final Widget? label;
  final Widget? icon;
  final Axis _direction;

  @override
  Widget build(BuildContext context) {
    final scale = MediaQuery.of(context).textScaleFactor;
    final gap =
        scale <= 1 ? 8.0 : lerpDouble(8, 4, math.min<double>(scale - 1, 1.0));
    return Flex(
      direction: _direction,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[icon!, SizedBox(width: gap), label!],
    );
  }
}
