import 'package:firebase_starter_ui/firebase_starter_ui.dart';
import 'package:flutter/material.dart';

/// {@template fs_dialog}
/// A Firebase Starter styled `Dialog`.
///
/// This type of dialog is typically used to alert the user and optionally pick
/// between a collection of options or choices.
///
/// This component is most commonly used in conjunction with [showDialog],
/// where an instance of this widget is constructed inside the `builder`
/// function.
///
/// The provided [title] will be displayed at the top, followed by the [content]
/// in the center. The list of [actions] are shown at the bottom right and are
/// commonly populated by [FSTextButton]s.
///
/// In its current implementation, this component is no different from the
/// `package:material` [AlertDialog].
/// {@endtemplate}
class FSDialog extends AlertDialog {
  /// {@macro fs_dialog}
  const FSDialog({
    Key? key,
    Widget? title,
    Widget? content,
    List<Widget>? actions,
    EdgeInsets contentPadding = const EdgeInsets.fromLTRB(
      24.0,
      20.0,
      24.0,
      24.0,
    ),
    EdgeInsets insetPadding = const EdgeInsets.symmetric(
      horizontal: 40.0,
      vertical: 24.0,
    ),
  }) : super(
          key: key,
          title: title,
          content: content,
          actions: actions,
          contentPadding: contentPadding,
          insetPadding: insetPadding,
        );
}
