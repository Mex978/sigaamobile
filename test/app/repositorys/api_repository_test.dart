import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import 'package:sigaamobile/app/repositorys/api_repository.dart';

class MockClient extends Mock implements Dio {}

void main() {
  ApiRepository repository;
  MockClient client;

  setUp(() {
    repository = ApiRepository();
    client = MockClient();
  });

  group('ApiRepository Test', () {
    test("First Test", () {
      expect(repository, isInstanceOf<ApiRepository>());
    });
  });
}
