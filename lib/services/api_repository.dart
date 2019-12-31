import 'dart:convert';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dio/dio.dart';
import 'package:sigaamobile/shared/utils.dart';

class ApiRepository extends Disposable {
  Dio _dio = Dio(BaseOptions(
      baseUrl: "http://sigaa-api.herokuapp.com",
      responseType: ResponseType.json));

  ApiRepository();

  Future login(String user, String pass) async {
    final response = await _dio
        .post('/info', data: {"user": user, "password": pass}).catchError((e) {
      print(e);
    });
    // print(response);
    return response.data;
  }

  Future<List<dynamic>> notas() async {
    final Map<String, String> _credentials = await getDataUser();

    final response = await _dio.post('/notas', data: {
      "user": _credentials["user"],
      "password": _credentials["pass"]
    }).catchError((e) {
      print(e);
    });
    return response.data;
  }

  @override
  void dispose() {}
}
