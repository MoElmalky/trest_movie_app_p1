import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    
    print("Request URL: ${options.uri.toString()}");

    print("Request Headers: ${options.headers}");

    print("Request Data: ${options.data}");

    return handler.next(options);
  }
}