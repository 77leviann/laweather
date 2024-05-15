import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:laweather/helpers/date_format_helper.dart';
import 'package:laweather/widgets/global/custom_date_widget.dart';

void main() {
  testWidgets('CustomDateWidget UI Test', (WidgetTester tester) async {
    final DateTime now = DateTime.now();
    final String formattedDate = DateFormatHelper.formatToDay(now);
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomDateWidget(
            forecastDay: now.millisecondsSinceEpoch,
            style: const TextStyle(fontSize: 16),
            height: 100,
            width: 100,
          ),
        ),
      ),
    );
    expect(find.text(formattedDate), findsOneWidget);
    final textWidget = find.text(formattedDate);
    final textWidgetFinder = tester.widget<Text>(textWidget);
    expect(textWidgetFinder.style!.fontSize, 16);
  });
}
