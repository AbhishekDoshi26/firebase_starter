// ignore_for_file: prefer_const_constructors
import 'package:firebase_starter_ui/firebase_starter_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'sliding_up_panel_test.mocks.dart';

@GenerateMocks([PanelController])
void main() {
  group('FSSlidingUpPanel', () {
    PanelController? panelController;

    setUp(() {
      panelController = MockPanelController();
    });

    testWidgets(
      'opens when header is tapped '
      'if panel was initially closed',
      (tester) async {
        const key = Key('__test_target__');

        when(panelController!.isPanelOpen).thenReturn(false);
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: FSSlidingUpPanel(
                panelController: panelController,
                panelHeader: Text(
                  'header',
                  key: key,
                ),
                panel: Text('panel'),
                child: Text('body'),
              ),
            ),
          ),
        );

        await tester.tap(find.byKey(key).first);
        await tester.pump();

        verify(panelController!.open()).called(1);
      },
    );

    testWidgets(
      'closes when header is tapped '
      'if panel was initially open',
      (tester) async {
        const key = Key('__test_target__');

        when(panelController!.isPanelOpen).thenReturn(true);
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: FSSlidingUpPanel(
                panelController: panelController,
                panelHeader: Text(
                  'header',
                  key: key,
                ),
                panel: Text('panel'),
                child: Text('body'),
              ),
            ),
          ),
        );

        await tester.tap(find.byKey(key).first);
        await tester.pump();

        verify(panelController!.close()).called(1);
      },
    );

    testWidgets(
      'calls onPanelPositionedChanged when panel position changes',
      (tester) async {
        const key = Key('__test_target__');
        final panelController = PanelController();

        double? panelPosition;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: FSSlidingUpPanel(
                panelController: panelController,
                onPanelPositionChanged: (value) => panelPosition = value,
                panelHeader: Text(
                  'header',
                  key: key,
                ),
                panel: Text('panel'),
                child: Text('body'),
              ),
            ),
          ),
        );

        await tester.tap(find.byKey(key).first);
        await tester.pumpAndSettle();

        expect(panelPosition, equals(1.0));

        await tester.tap(find.byKey(key).first);
        await tester.pumpAndSettle();

        expect(panelPosition, equals(0.0));
      },
    );
  });
}
