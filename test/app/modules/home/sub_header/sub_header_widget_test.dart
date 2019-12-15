// import 'package:flutter/material.dart';
// import 'package:bloc_pattern/bloc_pattern_test.dart';
import 'package:flutter_test/flutter_test.dart';

// import 'package:sigaamobile/app/modules/home/sub_header/sub_header_widget.dart';

main() {
  testWidgets('SubHeaderWidget has message', (WidgetTester tester) async {
    //await tester.pumpWidget(buildTestableWidget(SubHeaderWidget()));
    final textFinder = find.text('SubHeader');
    expect(textFinder, findsOneWidget);
  });
}
