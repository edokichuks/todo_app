// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:todo_app/src/core/utils/strings/strings.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class BaseResponse<T> {
  final T? data;
  @JsonKey(name: 'success')
  final bool status;
  final String? message;
  final String? title;

  const BaseResponse({
    this.data,
    required this.status,
    this.message,
    this.title,
  }) : super();

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return _$BaseResponseFromJson(json, fromJsonT);
  }

  factory BaseResponse.fromMap(Map<String, dynamic> json) {
    return BaseResponse(
      data: null,
      status: json['success'] ?? false,
      title: json['title'] ?? '',
      message: json['message'] is List
          ? List.from(json['message']).join(',')
          : json['message'] ?? Strings.genericErrorMessage,
    );
  }
}
