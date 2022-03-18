import 'package:firebase_starter_ui/firebase_starter_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FSScrollableTable', () {
    Widget cellBuilder(BuildContext _, int r, int c) => Text('$r.$c');
    testWidgets('renders header', (tester) async {
      var buildCallCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FSScrollableTable(
              rowCount: 3,
              columnCount: 3,
              headerBuilder: (_, c) {
                buildCallCount++;
                return Text('h$c');
              },
              cellBuilder: cellBuilder,
            ),
          ),
        ),
      );

      expect(buildCallCount, equals(3));
      expect(find.text('h0'), findsOneWidget);
      expect(find.text('h1'), findsOneWidget);
      expect(find.text('h2'), findsOneWidget);
    });

    testWidgets('renders cells', (tester) async {
      var buildCallCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FSScrollableTable(
              rowCount: 3,
              columnCount: 3,
              cellBuilder: (_, r, c) {
                buildCallCount++;
                return Text('$r.$c');
              },
            ),
          ),
        ),
      );

      expect(buildCallCount, equals(9));
      expect(find.text('0.0'), findsOneWidget);
      expect(find.text('2.2'), findsOneWidget);
    });

    testWidgets('allows scrolling to off-screen cell', (tester) async {
      const key = Key('__test_target__');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FSScrollableTable(
              rowCount: 20,
              columnCount: 20,
              cellBuilder: (_, r, c) {
                return SizedBox.fromSize(
                  size: const Size.square(64.0),
                  child: Text(
                    '$r.$c',
                    key: r != 19 || c != 19 ? null : key,
                  ),
                );
              },
            ),
          ),
        ),
      );

      expect(
        () => tester.ensureVisible(find.byKey(key)),
        returnsNormally,
      );
    });

    testWidgets(
      'shows header regardless of vertical scroll position',
      (tester) async {
        const headerKey = Key('__header_test_target__');
        const lastCellKey = Key('__last_cell_test_target__');

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: FSScrollableTable(
                rowCount: 100,
                columnCount: 1,
                headerBuilder: (_, __) {
                  return const Text(
                    '__HEADER__',
                    key: headerKey,
                  );
                },
                cellBuilder: (_, r, c) {
                  return SizedBox.fromSize(
                    size: const Size.square(64.0),
                    child: Text(
                      '$r.$c',
                      key: r != 99 ? null : lastCellKey,
                    ),
                  );
                },
              ),
            ),
          ),
        );

        await tester.ensureVisible(find.byKey(lastCellKey));

        expect(find.byKey(headerKey), findsOneWidget);
      },
    );
  });
}
