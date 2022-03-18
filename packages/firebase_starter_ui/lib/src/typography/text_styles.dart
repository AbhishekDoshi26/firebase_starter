import 'package:firebase_starter_ui/firebase_starter_ui.dart';
import 'package:flutter/widgets.dart';

/// Firebase Starter Text Style Definitions
abstract class FFTextStyle {
  /// Headline 1 Text Style
  static final TextStyle headline1 = _baseTextStyle.copyWith(
    fontSize: 32,
    fontWeight: FSFontWeight.black,
    height: 1.25,
  );

  /// Headline 2 Text Style
  static final TextStyle headline2 = _baseTextStyle.copyWith(
    fontSize: 26,
    fontWeight: FSFontWeight.extraBold,
    height: 1.25,
  );

  /// Headline 3 Text Style
  static final TextStyle headline3 = _baseTextStyle.copyWith(
    fontSize: 22,
    fontWeight: FSFontWeight.extraBold,
    height: 1.25,
  );

  /// Headline 4 Text Style
  static final TextStyle headline4 = _baseTextStyle.copyWith(
    fontSize: 20,
    fontWeight: FSFontWeight.extraBold,
    height: 1.25,
  );

  /// Headline 5 Text Style
  static final TextStyle headline5 = _baseTextStyle.copyWith(
    fontSize: 18,
    fontWeight: FSFontWeight.extraBold,
    height: 1.25,
  );

  /// Headline 6 Text Style
  static final TextStyle headline6 = _baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: FSFontWeight.extraBold,
    height: 1.25,
  );

  /// Subtitle 1 Text Style
  static final TextStyle subtitle1 = _baseTextStyle.copyWith(
    fontSize: 16,
  );

  /// Subtitle 2 Text Style
  static final TextStyle subtitle2 = _baseTextStyle.copyWith(
    fontSize: 14,
  );

  /// Body Text 1 Text Style
  static final TextStyle bodyText1 = _baseTextStyle.copyWith(
    fontSize: 14,
  );

  /// Body Text 2 Text Style (the default)
  static final TextStyle bodyText2 = _baseTextStyle.copyWith(
    fontSize: 16,
  );

  /// Button Text Style
  static final TextStyle button = _baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: FSFontWeight.semiBold,
  );

  /// Caption Text Style
  static final TextStyle caption = _baseTextStyle.copyWith(
    fontSize: 12,
  );

  /// Overline Text Style
  static final TextStyle overline = _baseTextStyle.copyWith(
    fontSize: 10,
    fontWeight: FSFontWeight.medium,
  );

  static const _baseTextStyle = TextStyle(
    fontFamily: 'Poppins',
    package: 'firebase_starter_ui',
    color: FSColors.darkBlue,
    fontWeight: FSFontWeight.regular,
    height: 1.5,
  );
}
