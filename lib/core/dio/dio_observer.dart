import 'package:dio/dio.dart';
import 'package:threedpass/core/utils/logger.dart';

class DioObserver extends Interceptor {
  const DioObserver();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String data = options.data.toString();
    if (options.data is FormData) {
      data =
          '${(options.data as FormData).fields}\n${(options.data as FormData).files}';
    }
    logger.t("\nREQUEST[${options.method}] => PATH: ${options.path}"
        "=> QUERY VALUES: ${options.queryParameters} => HEADERS: ${options.headers} => DATA: $data\n");
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.t("\nRESPONSE[${response.statusCode}] => DATA: ${response.data}\n");
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    logger.t(
      "\nRESPONSE ERROR[${err.response?.statusCode}] => DATA: ${err.response?.data}\nRequested url:${err.requestOptions.uri} params=${err.requestOptions.queryParameters} body=${err.requestOptions.data} method=${err.requestOptions.method}",
    );
    final modifiedError = DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      message:
          'Requested URI: ${err.requestOptions.uri}. Response code: ${err.response?.statusCode}. Response data: ${err.response?.data}',
      type: err.type,
      error: err.error,
      stackTrace: err.stackTrace,
    );
    return handler.next(modifiedError);
  }
}
