import 'package:dio/dio.dart';

import 'logger.dart';

/// Logging interceptor (unchanged from your original)
class LoggingInterceptor extends Interceptor {
  final _logger = LoggerDebug(
      headColor: LogColors.red, constTitle: "DioHelper Gate Logger");

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logger.green("➡️ Request: ${options.method} ${options.path}");
    _logger.green("Headers: ${options.headers}");
    _logger.green("Query Parameters: ${options.queryParameters}");
    _logger.green("Body: ${options.data}");
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.green(
        "⬅️ Response [${response.statusCode}] => Path: ${response.requestOptions.path}");

    _logger.green("Data: ${response.data}");
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logger.red("❌ Error: ${err.message}");
    _logger.red("Path: ${err.requestOptions.path}");
    if (err.response != null) {
      _logger.red("Response Data: ${err.response?.data}");
      _logger.red("Status Code: ${err.response?.statusCode}");
    }
    return handler.next(err);
  }
}
