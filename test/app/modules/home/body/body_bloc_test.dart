import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:sigaamobile/app/modules/home/body/body_bloc.dart';
import 'package:sigaamobile/app/modules/home/home_module.dart';

void main() {
  initModule(HomeModule());
  BodyBloc bloc;

  setUp(() {
    bloc = HomeModule.to.bloc<BodyBloc>();
  });

  group('BodyBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<BodyBloc>());
    });
  });
}
