// Dart imports:

// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter/material.dart' show debugPrint;
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:todo_app/src/core/config/exceptions/app_exceptions.dart';
import 'package:todo_app/src/core/services/client/rest_client.dart';
import 'package:todo_app/src/core/services/local_storage.dart/local_storage_export.dart';
import 'package:todo_app/src/features/photos/model/photo_model/photo_model.dart';

// Project imports:

final class PhotoRepository {
  PhotoRepository({
    required this.restClient,
    required this.storage,
  });
  final RestClient restClient;
  final LocalStorageRepo storage;

  Future<ApiResponse<String, List<PhotoModel>>> allPhotos(
      {required int limit, required int start}) async {
    try {
      final r = await restClient.getAllPhotos({
        '_start': start,
        '_limit': limit,
      });
      saveFetcedPhotos(r);
      var localCategories = getSavedPhotos();
      debugPrint('IN REPO SAVED LOCAL: ${localCategories.length}');
      return ($s1: '', $s2: r);
    } on DioExceptionType catch (e) {
      var localCategories = getSavedPhotos();
      debugPrint('ERROR: IN REPO SAVED LOCAL: ${localCategories.length}');
      return AppException.handleError((e), data: localCategories);
    }
  }

  void saveFetcedPhotos(List<PhotoModel> photos) async {
    final initList = getSavedPhotos();
    final first20 = [
      ...initList,
      ...photos,
    ];
    if (first20.length <= 20) {
      await storage.put(HiveKeys.photos, json.encode(first20));
    }
  }

  List<PhotoModel> getSavedPhotos() {
    var data = storage.get(HiveKeys.photos) ?? [];

    List newdata;
    if (data is String) {
      newdata = json.decode(data) as List;
      debugPrint('IF STRING: data is $newdata');
    } else if (data is List) {
      newdata = data;
      debugPrint('ELSE IF LIST:new data is $newdata');
    } else {
      newdata = [];
      debugPrint('ELSE:new data is $newdata');
    }

    var photos =
        List<PhotoModel>.from(newdata.map((e) => PhotoModel.fromJson(e)))
            .toList();
    return photos;
  }
}

final photoRepoProvider = Provider<PhotoRepository>((_) {
  return PhotoRepository(
    restClient: _.read(restClient),
    storage: _.read(localDB),
  );
});
