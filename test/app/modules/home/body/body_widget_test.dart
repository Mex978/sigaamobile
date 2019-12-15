// import 'package:flutter/material.dart';
// import 'package:bloc_pattern/bloc_pattern_test.dart';
import 'package:flutter_test/flutter_test.dart';

// import 'package:sigaamobile/app/modules/home/body/body_widget.dart';

main() {
  testWidgets('BodyWidget has message', (WidgetTester tester) async {
    //await tester.pumpWidget(buildTestableWidget(BodyWidget()));
    final textFinder = find.text('Body');
    expect(textFinder, findsOneWidget);
  });
}
