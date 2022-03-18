import 'package:firebase_starter_ui/firebase_starter_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FSSectionedListView', () {
    testWidgets('renders sections with header and body', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FSSectionedListView(
              sections: [
                Section.withHeading(
                  const Text('Header'),
                  [
                    const Text('Body'),
                  ],
                )
              ],
              itemBuilder: (context, breakdown) => breakdown as Widget,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Header'), findsOneWidget);
      expect(find.text('Body'), findsOneWidget);
    });

    testWidgets(
      'renders sections with header and body with a Divider '
      'when separated is True',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: FSSectionedListView(
                sections: [
                  Section.withHeading(
                    const Text('Header'),
                    [
                      const Text('Body'),
                    ],
                  )
                ],
                itemBuilder: (context, breakdown) => breakdown as Widget,
                separated: true,
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.text('Header'), findsOneWidget);
        expect(find.text('Body'), findsOneWidget);
        expect(find.byType(Divider), findsOneWidget);
      },
    );
  });

  group('Section', () {
    testWidgets('untitled shows no title in the section', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FSSectionedListView(
              sections: [
                Section.untitled(
                  [
                    const Text('Body'),
                  ],
                )
              ],
              itemBuilder: (context, breakdown) => breakdown as Widget,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Header'), findsNothing);
      expect(find.text('Body'), findsOneWidget);
    });

    testWidgets(
      'labeled shows a label with the body with no header',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: FSSectionedListView(
                sections: [
                  Section.labeled(
                    'label',
                    [
                      const Text('Body'),
                    ],
                  )
                ],
                itemBuilder: (context, breakdown) => breakdown as Widget,
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.text('Header'), findsNothing);
        expect(find.text('label'), findsOneWidget);
        expect(find.text('Body'), findsOneWidget);
      },
    );

    testWidgets(
      'labelOnly shows label without body and default header',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: FSSectionedListView<Widget>(
                sections: [
                  Section.labelOnly(
                    'label',
                  )
                ],
                itemBuilder: (context, breakdown) => breakdown as Widget,
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.text('Header'), findsNothing);
        expect(find.text('label'), findsOneWidget);
        expect(find.text('Body'), findsNothing);
      },
    );

    testWidgets(
      'headingOnly shows header without body and label',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: FSSectionedListView<Widget>(
                sections: [
                  Section.headingOnly(
                    const Text('Header'),
                  )
                ],
                itemBuilder: (context, breakdown) => breakdown as Widget,
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.text('Header'), findsOneWidget);
        expect(find.text('label'), findsNothing);
        expect(find.text('Body'), findsNothing);
      },
    );

    testWidgets(
      'headingOnly with a child shows header and child without body and label',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: FSSectionedListView<Widget>(
                sections: [
                  Section.headingOnly(
                    const Text('Header'),
                    child: const Text('child'),
                  )
                ],
                itemBuilder: (context, breakdown) => breakdown as Widget,
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.text('Header'), findsOneWidget);
        expect(find.text('child'), findsOneWidget);

        expect(find.text('label'), findsNothing);
        expect(find.text('Body'), findsNothing);
      },
    );
  });
}
