import 'package:flutter_test/flutter_test.dart';
import 'package:study_buddy/main.dart';

void main() {
  testWidgets('Home screen displays main elements', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(StudyBuddyApp()); // Use StudyBuddyApp if that's the correct name

    // Verify the title text is shown
    expect(find.text('Welcome to AI Study Buddy'), findsOneWidget);

    // Verify the "Study Timer" button is present
    expect(find.text('📚 Study Timer'), findsOneWidget);

    // Verify the "Take a Quiz" button is present
    expect(find.text('📝 Take a Quiz'), findsOneWidget);

    // Verify the "Daily Quotes" button is present
    expect(find.text('🌟 Daily Quotes'), findsOneWidget);
  });

  testWidgets('Study Timer button navigates to Study Timer Screen', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(StudyBuddyApp());

    // Tap on "Study Timer" button
    await tester.tap(find.text('📚 Study Timer'));
    await tester.pumpAndSettle();

    // Verify if it navigated to the intended screen
    expect(find.text('Study Timer'), findsOneWidget);
  });

  testWidgets('Take a Quiz button navigates to Quiz Screen', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(StudyBuddyApp());

    // Tap on "Take a Quiz" button
    await tester.tap(find.text('📝 Take a Quiz'));
    await tester.pumpAndSettle();

    // Verify if it navigated to the intended screen
    expect(find.text('Quiz'), findsOneWidget);
  });

  testWidgets('Daily Quotes button navigates to Daily Quotes Screen', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(StudyBuddyApp());

    // Tap on "Daily Quotes" button
    await tester.tap(find.text('🌟 Daily Quotes'));
    await tester.pumpAndSettle();

    // Verify if it navigated to the intended screen
    expect(find.text('Daily Motivation'), findsOneWidget);
  });
}
