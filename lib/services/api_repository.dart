import 'package:dio/dio.dart';
import 'package:sigaamobile/services/custom_interceptor.dart';
import 'package:sigaamobile/shared/utils.dart';

class ApiRepository {
  Dio _dio = Dio(BaseOptions(
    baseUrl: "http://sigaa-api.herokuapp.com",
    responseType: ResponseType.json,
  ));

  ApiRepository() {
    _dio.interceptors.add(CustomInterceptor());
  }

  Future<Map<String, dynamic>> login(String user, String pass) async {
    final response = await _dio.post('/info',
        data: {"username": user, "password": pass}).catchError((e) {
      print(e);
    });
    print("Response => $response");
    return response?.data;
  }

  Future<List<dynamic>> notas() async {
    final Map<String, String> _credentials = await getDataUser();

    final response = await _dio.post('/ver-notas', data: {
      "username": _credentials["user"],
      "password": _credentials["pass"]
    }).catchError((e) {
      print(e);
    });
    return response.data;
  }

  Future<List<dynamic>> disciplinas() async {
    final Map<String, String> _credentials = await getDataUser();

    final response = await _dio.post('/disciplinas', data: {
      "username": _credentials["user"],
      "password": _credentials["pass"]
    }).catchError((e) {
      print(e);
    });
    return response.data;
  }
}
