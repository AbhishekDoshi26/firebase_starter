import 'package:flutter/material.dart';

/// {@template FSListTile}
/// A Firebase Starter UI List tile.
/// ```dart
/// FFListTile(
///   title: Text('Create new League'),
///   leading: Icon(Icons.add),
///   trailing: Icon(Icons.add)
///   onTap:(){}
/// ),
/// ```
///
/// {@endtemplate}
class FSListTile extends ListTile {
  /// {@macro FSListTile}

  const FSListTile({
    Key? key,
    Widget? title,
    Widget? leading,
    Function? onTap,
    Widget? trailing,
    Widget? subtitle,
    bool? dense,
    EdgeInsets? contentPadding,
  }) : super(
          title: title,
          leading: leading,
          onTap: onTap as void Function()?,
          trailing: trailing,
          subtitle: subtitle,
          dense: dense,
          key: key,
          contentPadding: contentPadding,
        );
}
