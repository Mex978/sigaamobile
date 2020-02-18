import 'package:dio/dio.dart';

class CustomInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options) {
    print("================= onRequest =================");
    print("REQUEST[${options?.method}] => PATH: ${options?.path}");
    print("=============================================");
    return super.onRequest(options);
  }

  @override
  onResponse(Response response) {
    print("================ onResponse =================");
    print(
        "RESPONSE[${response?.statusCode}] => PATH: ${response?.request?.path} => DATA ${response.data}");
    print("=============================================");
    return super.onResponse(response);
  }

  @override
  onError(DioError err) {
    print("================== onError ==================");
    print(
        "ERROR[${err?.response?.statusCode}] => PATH: ${err?.request?.path} => MESSAGE ${err.message}");
    print("=============================================");
    return super.onError(err);
  }
}
