import 'dart:async';
import 'dart:convert';

import 'package:ali_com/core/utils/flash_helper.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../core/routes/app_routes_fun.dart';
import '../../core/routes/routes.dart';
import '../../core/utils/constant.dart';
import '../../features/auth/sign_in/controller/model.dart';
import 'helper_respons.dart';
import 'logger.dart';
import 'logger_interceptor.dart';

class DioServices {
  final Dio _dio = Dio();
  final _logger = LoggerDebug(
      headColor: LogColors.red, constTitle: "DioHelper Gate Logger");

  DioServices._internal() {
    init();
  }

  static final DioServices instance = DioServices._internal();
  factory DioServices() => instance;

  // Enhanced internet check with connection quality assessment
  Future<HelperResponse<T>> _checkInternet<T>() async {
    try {
      final connection = await InternetConnection().hasInternetAccess;
      if (!connection) {
        _logger.red("No internet connection detected.");
        return HelperResponse<T>.noInternet(
          message: 'please_check_your_internet_connection'.tr(),
        );
      }

      // Check connection quality
      final latency = await _measureLatency();
      if (latency > 1000) {
        // Threshold for poor connection
        _logger.yellow(
            "Poor internet connection detected (latency: ${latency}ms)");
        return HelperResponse<T>.poorConnection(
          message: 'poor_connection_check_the_quality_of_the_internet'.tr(),
        );
      }

      return HelperResponse<T>.success(message: 'Connected');
    } catch (e) {
      _logger.red("Internet check error: $e");
      return HelperResponse<T>.unknownError(
        message: 'internet_check_failed'.tr(),
      );
    }
  }

  // Measure network latency
  Future<int> _measureLatency() async {
    final stopwatch = Stopwatch()..start();
    try {
      await InternetConnection().hasInternetAccess;
      stopwatch.stop();
      return stopwatch.elapsedMilliseconds;
    } catch (e) {
      stopwatch.stop();
      return stopwatch.elapsedMilliseconds;
    }
  }

  late StreamSubscription<InternetStatus> internetSubscription;

  void startInternetMonitoring() {
    internetSubscription = InternetConnection().onStatusChange.listen(
      (status) {
        final isConnected = status == InternetStatus.connected;
        _logger.green("Internet connectivity changed: $status");

        if (!isConnected) {
          // pushAndRemoveUntil(NamedRoutes.i.internet);
        } else {
          // pushAndRemoveUntil(NamedRoutes.i.splash);
        }
      },
    );
  }

  void stopInternetMonitoring() {
    internetSubscription.cancel();
  }

  void init() {
    startInternetMonitoring();

    // Configure Dio's HttpClientAdapter with enhanced settings
    _dio.httpClientAdapter = IOHttpClientAdapter()
      ..onHttpClientCreate = (client) {
        client.connectionTimeout = const Duration(seconds: 30);
        client.idleTimeout = const Duration(seconds: 30);
        client.maxConnectionsPerHost = 10;
        client.badCertificateCallback =
            (cert, host, port) => true; // For debug only
        return client;
      };

    _dio.options = BaseOptions(
      baseUrl: AppConstants.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      responseType: ResponseType.json,
      headers: {
        if (UserModel.instance.isAuth)
          "Authorization": "Bearer ${UserModel.instance.data?.access?.token}",
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        "Accept-Language": navigatorKey.currentContext?.locale.languageCode,
        "x-localization": navigatorKey.currentContext?.locale.languageCode,
      }..removeWhere((key, value) => value == null || '$value'.isEmpty),
    );

    // Validate baseUrl
    if (!_dio.options.baseUrl.startsWith('http')) {
      throw Exception("Invalid baseUrl: must start with 'http'");
    }

    // Enhanced interceptors
    _dio.interceptors.addAll([
      _createAuthInterceptor(),
      _createLoggingInterceptor(),
      _createErrorInterceptor(),
      _createCacheInterceptor(),
      _createRetryInterceptor(),
      LoggingInterceptor(),
    ]);
  }

  // Auth interceptor to handle token refresh
  Interceptor _createAuthInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Clean up headers and parameters
        options.headers
            .removeWhere((k, v) => v == null || v.toString().isEmpty);
        options.queryParameters
            .removeWhere((k, v) => v == null || v.toString().isEmpty);

        // Add auth token if available
        if (UserModel.instance.isAuth) {
          options.headers['Authorization'] =
              'Bearer ${UserModel.instance.data?.access?.token}';

          // Check token expiration if you have expiry info
          // if (UserModel().isTokenExpired) {
          //   try {
          //     await _refreshToken();
          //     options.headers['Authorization'] = 'Bearer ${UserModel.instance.data?.access?.token}';
          //   } catch (e) {
          //     handler.reject(DioException(
          //       requestOptions: options,
          //       error: 'Token refresh failed',
          //     ));
          //     return;
          //   }
          // }
        }
        return handler.next(options);
      },
      onError: (error, handler) async {
        // Handle 401 errors by refreshing token
        if (error.response?.statusCode == 401) {
          try {
            // await _refreshToken();
            final opts = error.requestOptions;
            opts.headers['Authorization'] =
                'Bearer ${UserModel.instance.data?.access?.token}';
            final response = await _dio.fetch(opts);
            return handler.resolve(response);
          } catch (e) {
            _logger.red("Token refresh failed: $e");
            pushAndRemoveUntil(NamedRoutes.i.login);
            return handler.next(error);
          }
        }
        return handler.next(error);
      },
    );
  }

  // Enhanced logging interceptor
  Interceptor _createLoggingInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        _logger.blue('🌐 Request: ${options.method} ${options.uri}');
        _logger.blue('Headers: ${options.headers}');
        _logger.blue('Body: ${options.data}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        _logger.green(
            '✅ Response [${response.statusCode}] ${response.requestOptions.uri}');
        _logger.green('Data: ${_formatResponseData(response.data)}');
        return handler.next(response);
      },
      onError: (error, handler) {
        _logger.red('❌ Error: ${error.type} ${error.message}');
        _logger.red('Path: ${error.requestOptions.uri}');
        if (error.response != null) {
          _logger.red('Status: ${error.response?.statusCode}');
          _logger.red('Response: ${_formatResponseData(error.response?.data)}');
        }
        return handler.next(error);
      },
    );
  }

  // Format response data for logging
  String _formatResponseData(dynamic data) {
    if (data is Map || data is List) {
      return const JsonEncoder.withIndent('  ').convert(data);
    }
    return data.toString();
  }

  // Error interceptor for unified error handling
  Interceptor _createErrorInterceptor() {
    return InterceptorsWrapper(
      onError: (error, handler) {
        if (error.type == DioExceptionType.connectionTimeout ||
            error.type == DioExceptionType.receiveTimeout ||
            error.type == DioExceptionType.sendTimeout) {
          error = error.copyWith(
            error: 'Request timeout. Please try again.',
            type: DioExceptionType.receiveTimeout,
          );
        }
        return handler.next(error);
      },
    );
  }

  // Simple cache interceptor
  Interceptor _createCacheInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        // Add cache control headers if needed
        if (options.extra['cache'] == true) {
          options.headers['Cache-Control'] = 'max-age=60';
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        // Process cached responses if needed
        return handler.next(response);
      },
    );
  }

  // Retry interceptor for failed requests
  Interceptor _createRetryInterceptor() {
    return InterceptorsWrapper(
      onError: (error, handler) async {
        if (_shouldRetry(error)) {
          final retryCount = error.requestOptions.extra['retry'] ?? 0;
          if (retryCount < 3) {
            await Future.delayed(const Duration(seconds: 1));
            error.requestOptions.extra['retry'] = retryCount + 1;
            _logger.yellow('Retrying request (attempt ${retryCount + 1})');
            try {
              final response = await _dio.fetch(error.requestOptions);
              return handler.resolve(response);
            } catch (e) {
              return handler.next(error);
            }
          }
        }
        return handler.next(error);
      },
    );
  }

  bool _shouldRetry(DioException error) {
    return error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        (error.response?.statusCode ?? 0) >= 500;
  }

  // Enhanced GET method with caching and retry options
  Future<HelperResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    bool requireAuth = true,
    bool cache = false,
    int retryCount = 0,
  }) async {
    try {
      final internetCheck = await _checkInternet<T>();
      if (!internetCheck.isSuccess) return internetCheck;

      final mergedHeaders = {
        ..._dio.options.headers,
        if (headers != null) ...headers,
        if (cache) 'Cache-Control': 'max-age=60',
      };

      if (requireAuth && UserModel.instance.isAuth) {
        mergedHeaders["Authorization"] =
            "Bearer ${UserModel.instance.data!.access!.token}";
      }

      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: mergedHeaders,
          extra: {'retry': retryCount, 'cache': cache},
        ),
      );

      return _processResponse<T>(response);
    } on DioException catch (e) {
      return handleDioHelperError<T>(e);
    } catch (e, stackTrace) {
      _logger.red("Unexpected error in GET: $e\n$stackTrace");
      return HelperResponse<T>.unknownError(
        message: 'something_went_wrong_please_try_again'.tr(),
      );
    }
  }

  // Enhanced POST method with form data support
  Future<HelperResponse<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? formData,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    bool requireAuth = true,
    bool isFormData = false,
  }) async {
    try {
      final internetCheck = await _checkInternet<T>();
      if (!internetCheck.isSuccess) return internetCheck;

      final mergedHeaders = {
        ..._dio.options.headers,
        if (headers != null) ...headers,
      };

      if (requireAuth && UserModel.instance.isAuth) {
        mergedHeaders["Authorization"] =
            "Bearer ${UserModel.instance.data!.access!.token}";
      }

      final requestData =
          isFormData && formData != null ? FormData.fromMap(formData) : data;

      final response = await _dio.post(
        path,
        data: requestData,
        queryParameters: queryParameters,
        options: Options(headers: mergedHeaders),
      );

      return _processResponse<T>(response);
    } on DioException catch (e) {
      return handleDioHelperError<T>(e);
    } catch (e, stackTrace) {
      _logger.red("Unexpected error in POST: $e\n$stackTrace");
      return HelperResponse<T>.unknownError(
        message: 'something_went_wrong_please_try_again'.tr(),
      );
    }
  }

  // Enhanced PUT method
  Future<HelperResponse<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    bool requireAuth = true,
  }) async {
    try {
      final internetCheck = await _checkInternet<T>();
      if (!internetCheck.isSuccess) return internetCheck;

      final mergedHeaders = {
        ..._dio.options.headers,
        if (headers != null) ...headers,
      };

      if (requireAuth && UserModel.instance.isAuth) {
        mergedHeaders["Authorization"] =
            "Bearer ${UserModel.instance.data!.access!.token}";
      }

      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: mergedHeaders),
      );

      return _processResponse<T>(response);
    } on DioException catch (e) {
      return handleDioHelperError<T>(e);
    } catch (e, stackTrace) {
      _logger.red("Unexpected error in PUT: $e\n$stackTrace");
      return HelperResponse<T>.unknownError(
        message: 'something_went_wrong_please_try_again'.tr(),
      );
    }
  }

  // Enhanced DELETE method
  Future<HelperResponse<T>> delete<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    bool requireAuth = true,
  }) async {
    try {
      final internetCheck = await _checkInternet<T>();
      if (!internetCheck.isSuccess) return internetCheck;

      final mergedHeaders = {
        ..._dio.options.headers,
        if (headers != null) ...headers,
      };

      if (requireAuth && UserModel.instance.isAuth) {
        mergedHeaders["Authorization"] =
            "Bearer ${UserModel.instance.data!.access!.token}";
      }

      final response = await _dio.delete(
        path,
        queryParameters: queryParameters,
        options: Options(headers: mergedHeaders),
      );

      return _processResponse<T>(response);
    } on DioException catch (e) {
      return handleDioHelperError<T>(e);
    } catch (e, stackTrace) {
      _logger.red("Unexpected error in DELETE: $e\n$stackTrace");
      return HelperResponse<T>.unknownError(
        message: 'something_went_wrong_please_try_again'.tr(),
      );
    }
  }

  // Enhanced PATCH method
  Future<HelperResponse<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    bool requireAuth = true,
  }) async {
    try {
      final internetCheck = await _checkInternet<T>();
      if (!internetCheck.isSuccess) return internetCheck;

      final mergedHeaders = {
        ..._dio.options.headers,
        if (headers != null) ...headers,
      };

      if (requireAuth && UserModel.instance.isAuth) {
        mergedHeaders["Authorization"] =
            "Bearer ${UserModel.instance.data!.access!.token}";
      }

      final response = await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: mergedHeaders),
      );

      return _processResponse<T>(response);
    } on DioException catch (e) {
      return handleDioHelperError<T>(e);
    } catch (e, stackTrace) {
      _logger.red("Unexpected error in PATCH: $e\n$stackTrace");
      return HelperResponse<T>.unknownError(
        message: 'something_went_wrong_please_try_again'.tr(),
      );
    }
  }

  // Enhanced download method with progress tracking
  Future<HelperResponse<T>> download<T>(
    String urlPath,
    String savePath, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    bool requireAuth = true,
    ProgressCallback? onReceiveProgress,
    CancelToken? cancelToken,
  }) async {
    try {
      final internetCheck = await _checkInternet<T>();
      if (!internetCheck.isSuccess) return internetCheck;

      final mergedHeaders = {
        ..._dio.options.headers,
        if (headers != null) ...headers,
      };

      if (requireAuth && UserModel.instance.isAuth) {
        mergedHeaders["Authorization"] =
            "Bearer ${UserModel.instance.data!.access!.token}";
      }

      await _dio.download(
        urlPath,
        savePath,
        queryParameters: queryParameters,
        options: Options(headers: mergedHeaders),
        onReceiveProgress: onReceiveProgress,
        cancelToken: cancelToken,
      );

      return HelperResponse<T>.success(
        message: 'Download completed successfully',
      );
    } on DioException catch (e) {
      return handleDioHelperError<T>(e);
    } catch (e, stackTrace) {
      _logger.red("Unexpected error during download: $e\n$stackTrace");
      return HelperResponse<T>.unknownError(
        message: 'download_failed_please_try_again'.tr(),
      );
    }
  }

  // Process API response and normalize data
  HelperResponse<T> _processResponse<T>(Response response) {
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        if ((data.toString().contains("DOCTYPE") ||
            data.toString().contains("<script>") ||
            data["exception"] != null)) {
          _logger.red("Malformed or unexpected response received.");
          FlashHelper.showToast(data['message']);
          return HelperResponse<T>.malformedResponse(
            statusCode: response.statusCode ?? 500,
            message: 'Malformed or unexpected response',
          );
        }
        // Handle different response formats
        else if (data is Map<String, dynamic>) {
          return HelperResponse<T>.success(
            statusCode: response.statusCode!,
            message: data['message'] ?? 'Success',
            data: data as T,
          );
        } else if (data is List) {
          return HelperResponse<T>.success(
            statusCode: response.statusCode!,
            message: 'Success',
            data: {'items': data} as T,
          );
        } else if (data is String) {
          return HelperResponse<T>.success(
            statusCode: response.statusCode!,
            message: data,
            data: {'message': data} as T,
          );
        } else {
          return HelperResponse<T>.success(
            statusCode: response.statusCode!,
            message: 'Success',
            data: data as T,
          );
        }
      } else if ((response.data.toString().contains("DOCTYPE") ||
          response.data.toString().contains("<script>") ||
          response.data["exception"] != null)) {
        _logger.red("Malformed or unexpected response received.");
        return HelperResponse<T>.unknownError(
          statusCode: response.statusCode ?? 500,
          message: 'Malformed or unexpected response',
        );
      } else if (response.statusCode == 204) {
        return HelperResponse<T>.success(
          statusCode: response.statusCode!,
          message: 'No content',
        );
      } else if (response.statusCode == 400) {
        return HelperResponse<T>.badRequest(
          message: _extractErrorMessage(response.data),
        );
      } else if (response.statusCode == 401) {
        pushAndRemoveUntil(NamedRoutes.i.login);
        return HelperResponse<T>.unauthorized(
          message: 'session_expired_please_login_again'.tr(),
        );
      } else if (response.statusCode == 403) {
        return HelperResponse<T>.forbidden(
          message: 'access_denied'.tr(),
        );
      } else if (response.statusCode == 404) {
        // pushAndRemoveUntil(NamedRoutes.i.error);
        return HelperResponse<T>.notFound(
          message: 'resource_not_found'.tr(),
        );
      } else if (response.statusCode == 422) {
        return HelperResponse<T>.validationError(
          message: _extractValidationErrors(response.data),
        );
      } else if (response.statusCode == 429) {
        return HelperResponse<T>.tooManyRequests(
          message: 'too_many_requests_try_again_later'.tr(),
        );
      } else if (response.statusCode! >= 500) {
        return HelperResponse<T>.serverError(
          message: 'server_error_please_try_again_later'.tr(),
        );
      } else {
        return HelperResponse<T>.unknownError(
          statusCode: response.statusCode!,
          message: _extractErrorMessage(response.data),
        );
      }
    } catch (e, stackTrace) {
      _logger.red("Error processing response: $e\n$stackTrace");
      return HelperResponse<T>.unknownError(
        message: 'failed_to_process_response'.tr(),
      );
    }
  }

  // Extract error message from different response formats
  String _extractErrorMessage(dynamic data) {
    if (data == null) return 'unknown_error'.tr();

    if (data is String) {
      try {
        final json = jsonDecode(data) as Map<String, dynamic>;
        return json['message'] ?? json['error'] ?? data;
      } catch (e) {
        return data;
      }
    } else if (data is Map<String, dynamic>) {
      return data['message'] ??
          data['error'] ??
          data['errors']?.toString() ??
          'unknown_error'.tr();
    }

    return 'unknown_error'.tr();
  }

  // Extract validation errors from response
  String _extractValidationErrors(dynamic data) {
    if (data is Map<String, dynamic>) {
      if (data['errors'] is Map) {
        final errors =
            (data['errors'] as Map).values.expand((e) => e is List ? e : [e]);
        return errors.join(', ');
      }
      return data['message'] ?? 'validation_failed'.tr();
    }
    return 'validation_failed'.tr();
  }

  // Enhanced error handler
  HelperResponse<T> handleDioHelperError<T>(DioException error) {
    try {
      switch (error.type) {
        case DioExceptionType.badResponse:
          if (error.response != null) {
            FlashHelper.showToast(error.response!.data['message']);
            return _processResponse<T>(error.response!);
          }
          return HelperResponse<T>.unknownError(
            message: 'invalid_response_from_server'.tr(),
          );

        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          return HelperResponse<T>.timeout(
            message: 'request_timed_out_please_try_again'.tr(),
          );

        case DioExceptionType.cancel:
          return HelperResponse<T>.cancelled(
            message: 'request_cancelled'.tr(),
          );

        case DioExceptionType.connectionError:
          return HelperResponse<T>.noInternet(
            message: 'no_internet_connection'.tr(),
          );

        case DioExceptionType.unknown:
          if (error.message?.contains('SocketException') == true) {
            return HelperResponse<T>.noInternet(
              message: 'no_internet_connection'.tr(),
            );
          }
          return HelperResponse<T>.unknownError(
            message: 'something_went_wrong_please_try_again'.tr(),
          );

        case DioExceptionType.badCertificate:
          return HelperResponse<T>.badCertificate(
            message: 'security_certificate_error'.tr(),
          );
      }
    } catch (e, stackTrace) {
      _logger.red("Error handling Dio error: $e\n$stackTrace");
      return HelperResponse<T>.unknownError(
        message: 'error_processing_request'.tr(),
      );
    }
  }
}
