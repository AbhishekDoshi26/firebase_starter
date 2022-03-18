// ignore_for_file: prefer_const_constructors
import 'package:firebase_starter_ui/firebase_starter_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FSChip', () {
    testWidgets(
      'renders label',
      (tester) async {
        const key = Key('__test_target__');

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: FSChip(
                label: Text(
                  'label',
                  key: key,
                ),
              ),
            ),
          ),
        );

        expect(find.byKey(key), findsOneWidget);
      },
    );

    testWidgets(
      'renders icon',
      (tester) async {
        const key = Key('__test_target__');

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: FSChip(
                icon: FlutterLogo(
                  key: key,
                ),
                label: Text('label'),
              ),
            ),
          ),
        );

        expect(find.byKey(key), findsOneWidget);
      },
    );
  });
}
