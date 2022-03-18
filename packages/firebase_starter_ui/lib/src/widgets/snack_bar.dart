import 'package:firebase_starter_ui/firebase_starter_ui.dart';
import 'package:flutter/material.dart';

/// {@template FSSnackBar}
/// A Firebase Starter UI SnackBar.
///
/// ```dart
/// FSSnackBar.show(
/// context: context,
/// content: FSSnackBarContent.success(
///     child: Text("Success"),
///     textOnly: true,
///   ),
/// );
/// ```
/// {@endtemplate}
class FSSnackBar extends StatelessWidget {
  /// {@macro FSSnackBar}

  const FSSnackBar({Key? key, this.child}) : super(key: key);

  /// A child widget that is to be shown in the bottom sheet
  final Widget? child;

  /// Static method to show open the bottom sheet from the given [BuildContext]
  /// and build it's layout using the given builder.
  static void show({
    required BuildContext context,
    required FSSnackBarContent content,
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: content,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return child ?? const SizedBox();
  }
}

/// {@template FSSnackBarContent}
/// A Firebase Starter utility widget SnackBar content.
///
/// ```dart
/// FSSnackBar.show(
/// context: context,
/// content: FSSnackBarContent.failure(
///     child: Text("Failed"),
///     textOnly: false,
///   ),
/// );
/// ```
/// {@endtemplate}
class FSSnackBarContent extends StatelessWidget {
  /// {@macro FSSnackBarContent}

  const FSSnackBarContent({
    Key? key,
    required this.child,
    this.icon,
    this.textOnly = false,
  }) : super(key: key);

  /// Constructor to show a successful snackbar
  const FSSnackBarContent.success({
    Key? key,
    this.child,
    this.textOnly = false,
  })  : icon = const Icon(
          Icons.check_circle,
          color: FSColors.green,
        ),
        super(key: key);

  /// Constructor to show an informational snackbar
  const FSSnackBarContent.info({
    Key? key,
    this.child,
    this.textOnly = false,
  })  : icon = const Icon(
          Icons.info_outline,
          color: FSColors.blueAccent,
        ),
        super(key: key);

  /// Constructor to show a warning snackbar
  const FSSnackBarContent.warning({
    Key? key,
    this.child,
    this.textOnly = false,
  })  : icon = const Icon(
          Icons.warning,
          color: FSColors.orange,
        ),
        super(key: key);

  /// Constructor to show a failure snackbar
  const FSSnackBarContent.failure({
    Key? key,
    this.child,
    this.textOnly = false,
  })  : icon = const Icon(
          Icons.error,
          color: FSColors.red,
        ),
        super(key: key);

  /// Give a child widget to be displayed as the body of the snackbar
  final Widget? child;

  /// Icon to be displayed in the leading position
  final Widget? icon;

  /// Set this when only the child needs to be displayed. Defaults to false
  final bool textOnly;

  @override
  Widget build(BuildContext context) {
    return icon == null || textOnly
        ? child!
        : Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(FSSpacing.s6),
                child: icon,
              ),
              Expanded(child: child!),
            ],
          );
  }
}
