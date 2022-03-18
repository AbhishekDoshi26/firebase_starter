// ignore_for_file: prefer_const_constructors
import 'package:firebase_starter_ui/firebase_starter_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FSListTile', () {
    testWidgets('renders a list tile', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: FSListTile(
              trailing: Icon(Icons.add),
              title: Text('test'),
            ),
          ),
        ),
      );
      expect(find.byType(FSListTile), findsOneWidget);
    });
  });
}
