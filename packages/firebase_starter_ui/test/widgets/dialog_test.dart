// ignore_for_file: prefer_const_constructors
import 'package:firebase_starter_ui/firebase_starter_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FSDialog', () {
    test(
        'renders normally when contentPadding and '
        'insetPadding are not null', () {
      expect(
        () => FSDialog(
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
        ),
        returnsNormally,
      );
    });

    testWidgets(
      'renders title',
      (tester) async {
        const key = Key('__test_target__');

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: FSDialog(
                title: Text(
                  'title',
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
      'renders content',
      (tester) async {
        const key = Key('__test_target__');

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: FSDialog(
                content: Text(
                  'content',
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
      'renders actions',
      (tester) async {
        const key1 = Key('__test_target_1__');
        const key2 = Key('__test_target_2__');

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: FSDialog(
                actions: const [
                  Text(
                    'action1',
                    key: key1,
                  ),
                  Text(
                    'action2',
                    key: key2,
                  ),
                ],
              ),
            ),
          ),
        );

        expect(find.byKey(key1), findsOneWidget);
        expect(find.byKey(key2), findsOneWidget);
      },
    );
  });
}
