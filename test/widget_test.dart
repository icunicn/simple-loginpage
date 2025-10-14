import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uts_mobile1/main.dart';

void main() {
  testWidgets('App should show Login screen on start', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(MyApp());

    // Tunggu widget selesai build
    await tester.pumpAndSettle();

    // Pastikan teks 'Login' muncul (judul AppBar di LoginScreen)
    expect(find.text('Login'), findsOneWidget);

    // Pastikan tombol Register juga ada
    expect(find.text('Register'), findsOneWidget);
  });
}