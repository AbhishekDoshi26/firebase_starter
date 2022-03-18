import 'package:firebase_starter_ui/firebase_starter_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FSTheme', () {
    group('themeData', () {
      test('primary color is mediumLightGrey', () {
        expect(
          FSTheme.themeData.primaryColor,
          FSColors.mediumLightGrey,
        );
      });

      test('canvas color is mediumLightGrey', () {
        expect(
          FSTheme.themeData.canvasColor,
          FSColors.mediumLightGrey,
        );
      });

      test('background color is mediumLightGrey', () {
        expect(
          FSTheme.themeData.backgroundColor,
          FSColors.mediumLightGrey,
        );
      });

      test('scaffold background color is mediumLightGrey', () {
        expect(
          FSTheme.themeData.scaffoldBackgroundColor,
          FSColors.mediumLightGrey,
        );
      });

      test('accent color is lightBlue.shade300', () {
        expect(
          FSTheme.themeData.colorScheme.secondary,
          FSColors.lightBlue.shade300,
        );
      });
    });
  });

  group('FFDarkTheme', () {
    group('themeData', () {
      test('primary color is lightBlue', () {
        expect(
          FFDarkTheme.themeData.primaryColor,
          FSColors.lightBlue,
        );
      });

      test('accent color is lightBlue.shade300', () {
        expect(
          FFDarkTheme.themeData.colorScheme.secondary,
          FSColors.lightBlue.shade300,
        );
      });

      test('background color is grey.shade900', () {
        expect(
          FFDarkTheme.themeData.backgroundColor,
          FSColors.grey.shade900,
        );
      });
    });
  });
}
