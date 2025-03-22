import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:windspace_members/main.dart';
import 'package:windspace_members/home_screen.dart';

void main() {
  testWidgets('SplashScreen shows text and transitions to HomeScreen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: SplashScreen()));
    expect(find.text('WIND SPACE'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();
    expect(find.byType(HomeScreen), findsOneWidget);
  });
}
