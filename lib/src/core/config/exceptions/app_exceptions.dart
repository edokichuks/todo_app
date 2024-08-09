// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:todo_app/src/core/config/response/base_response.dart';
import 'package:todo_app/src/core/utils/loggers.dart';
import 'package:todo_app/src/core/utils/strings/strings.dart';

class AppException {
  //HANDLE ERROR
  static BaseResponse<T> handleError<T>(
    DioException e, {
    T? data,
  }) {
    if (e.response != null && DioExceptionType.badResponse == e.type) {
      if (e.response == null ||
          DioExceptionType.badResponse != e.type &&
              e.response!.statusCode! >= 500) {
        return BaseResponse(
          status: false,
          title: 'Failed',
          message: Strings.serverError,
          data: data,
        );
      }
      if (e.response?.data is Map<String, dynamic>) {
        debugLog(e.response?.data);
        return BaseResponse(
            status: false,
            title: e.response?.data["title"],
            data: data,
            message: (e.response?.data["error"] == null)
                ? e.response?.data["message"]
                : (e.response?.data["error"] is String)
                    ? e.response?.data["error"]
                    : e.response?.data["error"]["message"]);
      } else if (e.response?.data is String) {
        debugLog(e.response?.data);
        return BaseResponse(
          status: false,
          title: e.response?.data['title'],
          message: e.response?.data,
          data: data,
        );
      }
    }
    return BaseResponse(
      status: false,
      title: 'Failed',
      data: data,
      message: _mapException(e.type),
    );
  }

  static _mapException(DioExceptionType? error) {
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
