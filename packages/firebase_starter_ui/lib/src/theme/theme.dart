import 'package:firebase_starter_ui/firebase_starter_ui.dart';
import 'package:flutter/material.dart';

/// Namespace for Default Firebase Starter [ThemeData].
abstract class FSTheme {
  /// Default `ThemeData` for Firebase Starter UI.
  static final ThemeData themeData = ThemeData(
    primaryColor: _backgroundColor,
    canvasColor: _backgroundColor,
    backgroundColor: _backgroundColor,
    scaffoldBackgroundColor: _backgroundColor,
    iconTheme: _iconTheme,
    appBarTheme: _appBarTheme,
    dividerTheme: _dividerTheme,
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
    buttonTheme: _buttonTheme,
    splashColor: FSColors.transparent,
    snackBarTheme: _snackBarTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
    outlinedButtonTheme: _outlinedButtonTheme,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: FSColors.lightBlue.shade300,
    ),
  );

  static final _snackBarTheme = SnackBarThemeData(
    contentTextStyle: FFTextStyle.bodyText1.copyWith(
      color: FSColors.white,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(FSSpacing.s8),
    ),
    actionTextColor: FSColors.lightBlue.shade300,
    backgroundColor: FSColors.black,
    elevation: 4.0,
    behavior: SnackBarBehavior.floating,
  );

  static const _backgroundColor = FSColors.mediumLightGrey;

  static final _appBarTheme = AppBarTheme(
    iconTheme: _iconTheme,
    toolbarTextStyle: _textTheme
        .copyWith(
          headline6: FFTextStyle.headline6.copyWith(
            color: FSColors.black,
          ),
        )
        .bodyText2,
    titleTextStyle: _textTheme
        .copyWith(
          headline6: FFTextStyle.headline6.copyWith(
            color: FSColors.black,
          ),
        )
        .headline6,
  );

  static const _iconTheme = IconThemeData(color: FSColors.black);

  static final _dividerTheme = DividerThemeData(
    color: FSColors.grey[200],
    space: FSSpacing.s1,
    thickness: FSSpacing.s1,
    indent: 56.0,
    endIndent: FSSpacing.s16,
  );

  static final _textTheme = TextTheme(
    headline1: FFTextStyle.headline1,
    headline2: FFTextStyle.headline2,
    headline3: FFTextStyle.headline3,
    headline4: FFTextStyle.headline4,
    headline5: FFTextStyle.headline5,
    headline6: FFTextStyle.headline6,
    subtitle1: FFTextStyle.subtitle1,
    subtitle2: FFTextStyle.subtitle2,
    bodyText1: FFTextStyle.bodyText1,
    bodyText2: FFTextStyle.bodyText2,
    button: FFTextStyle.button,
    caption: FFTextStyle.caption,
    overline: FFTextStyle.overline,
  );

  static final _inputDecorationTheme = InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: FSColors.grey.shade400,
        width: FSSpacing.s1,
      ),
    ),
    fillColor: FSColors.grey.shade100,
    filled: true,
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: FSColors.lightBlue,
        width: FSSpacing.s2,
      ),
    ),
    labelStyle: TextStyle(
      color: FSColors.grey.shade500,
    ),
    hintStyle: TextStyle(
      color: FSColors.grey.shade500,
    ),
  );

  static final _buttonTheme = ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(FSSpacing.s8),
    ),
  );

  static final _elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: FSColors.darkBlue,
      minimumSize: const Size(0, 48),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          FSSpacing.s80,
        ),
      ),
      elevation: FSSpacing.s8,
    ),
  );

  static final _outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      primary: FSColors.darkBlue,
      minimumSize: const Size(0, 48),
      side: const BorderSide(
        width: 2,
        style: BorderStyle.solid,
        color: FSColors.darkBlue,
      ),
      backgroundColor: FSColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          FSSpacing.s80,
        ),
      ),
    ),
  );
}

/// Namespace for Dark Mode Firebase Starter [ThemeData].
abstract class FFDarkTheme implements FSTheme {
  /// Dark mode `ThemeData` for Firebase Starter UI
  static final ThemeData themeData = ThemeData(
    brightness: Brightness.dark,
    primaryColor: FSColors.lightBlue,
    canvasColor: _backgroundColor,
    backgroundColor: _backgroundColor,
    scaffoldBackgroundColor: _backgroundColor,
    iconTheme: _iconTheme,
    appBarTheme: _appBarTheme,
    dividerTheme: _dividerTheme,
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
    buttonTheme: _buttonTheme,
    splashColor: FSColors.transparent,
    snackBarTheme: _snackBarTheme,
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: FSColors.lightBlue.shade300),
  );

  static final _snackBarTheme = SnackBarThemeData(
    contentTextStyle: FFTextStyle.bodyText1.copyWith(
      color: FSColors.black,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(FSSpacing.s8),
    ),
    actionTextColor: FSColors.lightBlue.shade300,
    backgroundColor: FSColors.grey.shade300,
    elevation: 4.0,
    behavior: SnackBarBehavior.floating,
  );

  static final _backgroundColor = FSColors.grey.shade900;

  static final _appBarTheme = AppBarTheme(
    iconTheme: _iconTheme,
    toolbarTextStyle: _textTheme.bodyText2,
    titleTextStyle: _textTheme.headline6,
  );

  static const _iconTheme = IconThemeData(color: FSColors.white);

  static final _dividerTheme = DividerThemeData(
    color: FSColors.grey.shade700,
    space: FSSpacing.s1,
    thickness: FSSpacing.s1,
    indent: 56.0,
    endIndent: FSSpacing.s16,
  );

  static final _textTheme = TextTheme(
    headline1: FFTextStyle.headline1,
    headline2: FFTextStyle.headline2,
    headline3: FFTextStyle.headline3,
    headline4: FFTextStyle.headline4,
    headline5: FFTextStyle.headline5,
    headline6: FFTextStyle.headline6,
    subtitle1: FFTextStyle.subtitle1,
    subtitle2: FFTextStyle.subtitle2,
    bodyText1: FFTextStyle.bodyText1,
    bodyText2: FFTextStyle.bodyText2,
    button: FFTextStyle.button,
    caption: FFTextStyle.caption,
    overline: FFTextStyle.overline,
  );

  static final _inputDecorationTheme = InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: FSColors.grey.shade400,
        width: FSSpacing.s1,
      ),
    ),
    fillColor: FSColors.grey.shade800,
    filled: true,
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: FSColors.lightBlue,
        width: FSSpacing.s2,
      ),
    ),
    hintStyle: TextStyle(
      color: FSColors.grey.shade400,
    ),
  );

  static final _buttonTheme = ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(FSSpacing.s8),
    ),
  );
}
