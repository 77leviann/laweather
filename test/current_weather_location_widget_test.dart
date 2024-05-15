import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:laweather/widgets/global/weather_location_widget.dart';


void main() {
  testWidgets('WeatherLocationWidget UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: WeatherLocationWidget(
            locationName: 'New York', 
            locationCode: 'US', 
            height: 50, 
            width: 150, 
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ),
      ),
    );

    final textWidget = find.text('New York, United States');

    expect(textWidget, findsOneWidget);
  });
}