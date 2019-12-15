import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:sigaamobile/app/modules/home/sub_header/sub_header_bloc.dart';
import 'package:sigaamobile/app/modules/home/home_module.dart';

void main() {
  initModule(HomeModule());
  SubHeaderBloc bloc;

  setUp(() {
    bloc = HomeModule.to.bloc<SubHeaderBloc>();
  });

  group('SubHeaderBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<SubHeaderBloc>());
    });
  });
}
