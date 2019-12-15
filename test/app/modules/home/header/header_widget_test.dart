import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sigaamobile/app/modules/home/header/header_widget.dart';

main() {
  testWidgets('HeaderWidget has message', (WidgetTester tester) async {
    // await tester.pumpWidget(buildTestableWidget(HeaderWidget("")));
    final textFinder = find.text('Header');
    expect(textFinder, findsOneWidget);
  });
}
