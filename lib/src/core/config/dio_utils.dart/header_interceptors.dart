// Dart imports:
import 'dart:async';

// Package imports:
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:todo_app/src/application/repositories/user/user_repository.dart';
import 'package:todo_app/src/core/config/dio_utils.dart/auth_strings.dart';
import 'package:todo_app/src/core/utils/loggers.dart';

class HeaderInterceptor extends Interceptor {
  HeaderInterceptor({
    required this.dio,
    required this.userRepository,
    required this.ref,
  });
  final Dio dio;
  final Ref ref;
  final UserRepository userRepository;

  @override
  FutureOr<dynamic> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    try {
      final token = userRepository.getToken();
      if (token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
        debugLog('[TOKEN]$token');
      }
    } catch (e) {
      debugLog(e);
    }
    debugLog('[URL]${options.uri}');
    debugLog('[BODY] ${options.data}');
    debugLog('[METHOD] ${options.method}');
    debugLog('[QUERIES]${options.queryParameters}');

    handler.next(options);
    return options;
  }

  @override
  FutureOr<dynamic> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.requestOptions.path.contains('/auth/')) {
      debugLog("[ERROR] ${err.requestOptions.uri}");
      debugLog("[ERROR] ${err.response}");
      handler.next(err);
      return err;
    }
    if (err.response != null && err.response!.statusCode == 401) {
      await _refreshToken(err, handler, dio, userRepository, ref);
      return;
    }
    debugLog('[ERROR] ${err.requestOptions.uri}');
    debugLog('[ERROR] ${err.response}');
    handler.next(err);
    return err;
  }

  @override
  FutureOr<dynamic> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    debugLog(
      '[RESPONSE FROM ${response.requestOptions.path}]: ${response.data}',
    );
    handler.next(response);
    return response;
  }
}

Future<void> _refreshToken(DioException error, ErrorInterceptorHandler handler,
    Dio dio, UserRepository userRepository, Ref ref) async {
  final refreshToken = userRepository.getRefreshToken();
  try {
    final r = await Dio().post('${AuthStrings.baseUrl}/auth/refresh-token',
        options: Options(headers: {"Authorization": "Bearer $refreshToken"}));

    if (r.statusCode == 200 || r.statusCode == 201) {
      userRepository.saveToken(r.data['data']['accessToken']);
      userRepository.saveRefreshToken(r.data['data']['refreshToken']);
      debugLog("Access Token gotten and saved");
    }
    return handleError(handler, error, dio);
  } on DioException catch (_) {
    debugLog('refresh error===>> $_');
    //!logout fxn in profile notifier
    // ref.read(profileNotifierProvider.notifier).logout();
    return;
  }
}

Future<void> handleError(
  ErrorInterceptorHandler handler,
  DioException err,
  Dio dio,
) async {
  final opts = Options(
    method: err.requestOptions.method,
    headers: err.requestOptions.headers,
  );
  final cloneReq = await dio.request<Map<String, dynamic>?>(
    err.requestOptions.path,
    options: opts,
    data: err.requestOptions.data,
    queryParameters: err.requestOptions.queryParameters,
  );

  return handler.resolve(cloneReq);
}

//<=================Places Headers================>

class PlacesInterceptor extends Interceptor {
  final Dio dio;
  PlacesInterceptor({
    required this.dio,
  });

  @override
  FutureOr<dynamic> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    handler.next(options);
    if (options.data != null) {
      debugLog('[URL]${options.uri}');
      debugLog("[BODY] ${options.data}");
      debugLog("[METHOD] ${options.method}");
    }
    return options;
  }

  @override
  FutureOr<dynamic> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    handler.next(err);
    return err;
  }

  @override
  FutureOr<dynamic> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    debugLog("Response: ${response.data}");
    handler.next(response);
    return response;
  }
}
