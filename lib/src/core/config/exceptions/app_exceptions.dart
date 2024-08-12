// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:todo_app/src/core/utils/loggers.dart';
import 'package:todo_app/src/core/utils/strings/strings.dart';

typedef ApiResponse<String, T> = ({String $s1, T $s2});

class AppException {
  //!HANDLE ERROR

  static ApiResponse<String, T> handleError<T>(
    DioExceptionType e, {
    required T data,
  }) {
    debugLog('error handled by exception : ${_mapException(e).toString()}');
    return ($s1: _mapException(e), $s2: data);
  }

  static String _mapException(DioExceptionType? error) {
    if (DioExceptionType.connectionTimeout == error ||
        DioExceptionType.receiveTimeout == error ||
        DioExceptionType.sendTimeout == error) {
      return Strings.timeout;
    } else if (DioExceptionType.connectionError == error) {
      return Strings.connectionError;
    }
    return Strings.genericErrorMessage;
  }
}
