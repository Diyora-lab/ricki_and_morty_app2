import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

String baseUrl = 'https://rickandmortyapi.com/api/character/';
const _duration = Duration(seconds: 30);

@lazySingleton
class DioSettings {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      sendTimeout: _duration,
      connectTimeout: _duration,
      receiveTimeout: _duration,
    ),
  );

  DioSettings() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          print('*********');
          print('ON REQUEST');
          print('${options.method}: ${options.uri}');
          print('Content Type : ${options.contentType}');
          print('Response Type : ${options.responseType}');
          print('Connection Timeout : ${options.connectTimeout}');
          print('Send Timeout : ${options.sendTimeout}');
          print('Extra : ${options.extra}');
          print('Headers : ${options.headers}');
          print('Query Params : ${options.queryParameters}');
          print('Data : ${options.data}');

          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          print('*********');
          print('ON RESPONSE');
          print('Status Code : ${response.statusCode}');
          print('Real Uri : ${response.realUri}');
          print('Request Options : ${response.requestOptions}');
          print('Extra: ${response.extra}');
          print('Status Message: ${response.statusMessage}');
          print('Data : ${response.data}');

          return handler.next(response);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) {
          // Do something with response error.
          // If you want to resolve the request with some custom data,
          // you can resolve a `Response` object using `handler.resolve(response)`.
          return handler.next(error);
        },
      ),
    );
  }
}
