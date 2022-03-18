import 'package:firebase_starter_ui/firebase_starter_ui.dart';
import 'package:flutter/material.dart';

/// {@template FSAppBar}
/// A Firebase Starter app bar
///
/// All fields are optional. To left-align the title, pass `false`into
/// [centerTitle]. To customize the right-hand side of the app bar, pass a
/// [List] of widgets into [actions]. In order to add a subtitle under the
/// [title] widget, pass a [Column] containing the custom-styled title and
/// subtitle widgets into the [title] property. Use the [bottom] property to
/// add a widget such as a [TabBar].
///
/// {@endtemplate}
class FSAppBar extends AppBar {
  /// {@macro FSAppBar}
  FSAppBar({
    Key? key,
    Widget? title,
    bool centerTitle = true,
    Widget? leading,
    List<Widget>? actions,
    Widget? bottom,
  }) : super(
          key: key,
          leading: leading,
          automaticallyImplyLeading: centerTitle,
          title: title,
          actions: actions,
          centerTitle: centerTitle,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(
              bottom != null ? kTextTabBarHeight : FSSpacing.s2,
            ),
            child: Column(
              children: [
                if (bottom != null)
                  SizedBox(
                    height: kTextTabBarHeight,
                    child: bottom,
                  ),
                Container(
                  height: FSSpacing.s2,
                  color: FSColors.lightBlue,
                )
              ],
            ),
          ),
        );
}
