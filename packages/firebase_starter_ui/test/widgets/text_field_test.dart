// ignore_for_file: prefer_const_constructors
import 'package:firebase_starter_ui/firebase_starter_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FSTextField', () {
    testWidgets('renders text field with decoration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: FSTextField(
              textInputAction: TextInputAction.search,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Player Search',
              ),
            ),
          ),
        ),
      );
      expect(find.byType(FSTextField), findsOneWidget);
    });
  });
}
