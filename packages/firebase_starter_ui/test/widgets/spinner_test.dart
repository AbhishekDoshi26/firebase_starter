// ignore_for_file: prefer_const_constructors
import 'package:firebase_starter_ui/firebase_starter_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FSSpinner', () {
    testWidgets('renders indeterminate spinner', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: FSSpinner(),
          ),
        ),
      );
      expect(find.byType(FSSpinner), findsOneWidget);
    });

    testWidgets('renders indeterminate spinner with a message', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: FSSpinner(
              text: 'Loading...',
            ),
          ),
        ),
      );
      expect(find.text('Loading...'), findsOneWidget);
    });
  });
}
