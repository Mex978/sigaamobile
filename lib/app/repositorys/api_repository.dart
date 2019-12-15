import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dio/dio.dart';

class ApiRepository extends Disposable {
  Dio _dio = Dio(BaseOptions(baseUrl: "http://192.168.100.159:5000"));

  ApiRepository();

  Future login(String user, String pass) async {
    final response = await _dio
        .post('/info', data: {"user": user, "password": pass}).catchError((e) {
      print(e);
    });
    print(response);
    return response.data;
  }

  @override
  void dispose() {}
}
