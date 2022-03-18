// ignore_for_file: prefer_const_constructors
import 'package:firebase_starter_ui/firebase_starter_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([BuildContext])
void main() {
  group('FSSnackBar', () {
    testWidgets(
      'show FSSnackBar when show constructor is used',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      FSSnackBar.show(
                        context: context,
                        content: FSSnackBarContent.success(
                          child: Text('snackbar'),
                        ),
                      );
                    },
                    child: const Text('test'),
                  );
                },
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();
        await tester.tap(find.text('test'));
        await tester.pumpAndSettle();
        expect(find.text('snackbar'), findsOneWidget);
      },
    );

    group('FSSnackBarContent', () {
      testWidgets(
        '.success shows FSSnackBar with green icon',
        (tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: Builder(
                  builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        FSSnackBar.show(
                          context: context,
                          content: FSSnackBarContent.success(
                            child: Text('snackbar'),
                          ),
                        );
                      },
                      child: const Text('test'),
                    );
                  },
                ),
              ),
            ),
          );
          await tester.pumpAndSettle();
          await tester.tap(find.text('test'));
          await tester.pumpAndSettle();
          final icon = tester.widget(find.byType(Icon)) as Icon;
          expect(icon.color, FSColors.green);
          expect(find.text('snackbar'), findsOneWidget);
        },
      );

      testWidgets(
        '.info shows FSSnackBar with blueAccent icon',
        (tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: Builder(
                  builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        FSSnackBar.show(
                          context: context,
                          content: FSSnackBarContent.info(
                            child: Text('snackbar'),
                          ),
                        );
                      },
                      child: const Text('test'),
                    );
                  },
                ),
              ),
            ),
          );
          await tester.pumpAndSettle();
          await tester.tap(find.text('test'));
          await tester.pumpAndSettle();
          final icon = tester.widget(find.byType(Icon)) as Icon;
          expect(icon.color, FSColors.blueAccent);
          expect(find.text('snackbar'), findsOneWidget);
        },
      );

      testWidgets(
        '.info shows FSSnackBar with orange icon',
        (tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: Builder(
                  builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        FSSnackBar.show(
                          context: context,
                          content: FSSnackBarContent.warning(
                            child: FSSnackBarContent(
                              child: Text('snackbar'),
                            ),
                          ),
                        );
                      },
                      child: const FSSnackBar(child: Text('test')),
                    );
                  },
                ),
              ),
            ),
          );
          await tester.pumpAndSettle();
          await tester.tap(find.text('test'));
          await tester.pumpAndSettle();
          final icon = tester.widget(find.byType(Icon)) as Icon;
          expect(icon.color, FSColors.orange);
          expect(find.text('snackbar'), findsOneWidget);
        },
      );

      testWidgets(
        '.info shows FSSnackBar with red icon',
        (tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: Builder(
                  builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        FSSnackBar.show(
                          context: context,
                          content: FSSnackBarContent.failure(
                            child: Text('snackbar'),
                          ),
                        );
                      },
                      child: const Text('test'),
                    );
                  },
                ),
              ),
            ),
          );
          await tester.pumpAndSettle();
          await tester.tap(find.text('test'));
          await tester.pumpAndSettle();
          final icon = tester.widget(find.byType(Icon)) as Icon;
          expect(icon.color, FSColors.red);
          expect(find.text('snackbar'), findsOneWidget);
        },
      );

      testWidgets(
        'shows FSSnackBar with ony text when textOnly is set',
        (tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: Builder(
                  builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        FSSnackBar.show(
                          context: context,
                          content: FSSnackBarContent.success(
                            textOnly: true,
                            child: Text('snackbar'),
                          ),
                        );
                      },
                      child: const Text('test'),
                    );
                  },
                ),
              ),
            ),
          );
          await tester.pumpAndSettle();
          await tester.tap(find.text('test'));
          await tester.pumpAndSettle();
          expect(find.byType(Icon), findsNothing);
          expect(find.text('snackbar'), findsOneWidget);
        },
      );
    });
  });
}
