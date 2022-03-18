import 'package:flutter/material.dart';

/// Defines the color palette for the Firebase Starter UI Kit.
/// Each color is a single color as well a color swatch with shades.
///
/// The color's shades are referred to by index. The greater the index, the
/// darker the color. There are 10 valid indices: 50, 100, 200, ..., 900.
abstract class FSColors {
  /// Black
  static const Color black = Color(0xFF000000);

  /// Faded Black
  static const Color fadedBlack = Color(0xFF939393);

  /// White
  static const Color white = Color(0xFFFFFFFF);

  /// Transparent
  static const Color transparent = Color(0x00000000);

  /// Blue Grey
  static const MaterialColor blueGrey = Colors.blueGrey;

  /// The Grey primary color and swatch.
  static const MaterialColor grey = Colors.grey;

  /// Dark grey
  static const Color darkGrey = Color(0xFF717171);

  /// Very Light Grey
  static const Color veryLightGrey = Color(0xFFF7F7F7);

  /// Light Grey
  static const Color lightGrey = Color(0xffF5F5F5);

  /// The medium light grey color.
  static const Color mediumLightGrey = Color(0xFFF0F0F0);

  /// The slightly lighter shade of [grey].
  static const Color slightlyLightGrey = Color(0xFFE3E0E3);

  /// The slightly darker shade of [grey].
  static const Color slightlyDarkGrey = Color(0xFF959295);

  /// The Red primary color and swatch.
  static const MaterialColor red = Colors.red;

  /// Deep orange
  static const Color deepOrange = Colors.deepOrangeAccent;

  /// Orange
  static const MaterialColor orange = Colors.orange;

  /// The Yellow primary color and swatch.
  static const MaterialColor yellow = Colors.yellow;

  /// The Green primary color and swatch.
  static const MaterialColor green = Colors.green;

  /// The Blue primary color and swatch.
  static const MaterialColor lightBlue = Colors.lightBlue;

  /// Blue Accent
  static const Color blueAccent = Colors.blueAccent;

  /// Lilac
  static const Color lilac = Color(0xffbb65fe);

  /// Purple
  static const Color purple = Colors.purple;

  /// Dark Blue
  static const Color darkBlue = Color(0xff1E6AD3);

  /// Fluro Color
  static const Color fluroGreen = Color(0xFF21F77C);

  /// Turquoise
  static const Color turquoise = Color(0xff0fccb6);

  /// Purplish Red
  static const Color purplishRed = Color(0xfff9286a);

  /// Red Accent
  static const Color redAccent = Colors.redAccent;

  /// Green Accent
  static const Color greenAccent = Colors.greenAccent;

  static const skyBlue = Color(0xff09A7FE);

  static const blue = Color(0xff1681E3);

  static const blueMarine = Color(0xff001738);
}

//TODO: add new colors to gallery
