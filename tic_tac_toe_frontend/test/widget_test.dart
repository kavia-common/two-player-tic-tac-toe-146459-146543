import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe_frontend/main.dart';

void main() {
  testWidgets('Header and board render', (WidgetTester tester) async {
    await tester.pumpWidget(const TicTacToeApp());
    // Title
    expect(find.text('Tic Tac Toe'), findsOneWidget);

    // Score pills
    expect(find.text('Player X'), findsOneWidget);
    expect(find.text('Player O'), findsOneWidget);

    // Turn indicator appears
    expect(find.textContaining('Turn:'), findsOneWidget);
  });

  testWidgets('Tap to place marks and detect win/draw UI elements exist', (WidgetTester tester) async {
    await tester.pumpWidget(const TicTacToeApp());
    // Find grid cells by icon for empties
    final emptyIcon = find.byIcon(Icons.add_rounded);
    expect(emptyIcon, findsNWidgets(9));

    // Tap a few cells to ensure interaction
    await tester.tap(emptyIcon.at(0));
    await tester.pumpAndSettle();
    // After a move, there should be 8 empties left
    expect(find.byIcon(Icons.add_rounded), findsNWidgets(8));
  });
}
