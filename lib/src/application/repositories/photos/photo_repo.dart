// Dart imports:

// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:dio/dio.dart';
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
      saveMealCategoriesLocally(r);
      var localCategories = getMealCategoriesLocally();
      print('IN REPO SAVED LOCAL: ${localCategories.length}');
      return ($s1: '', $s2: r);
    } on DioExceptionType catch (e) {
      var localCategories = getMealCategoriesLocally();
      print('ERROR: IN REPO SAVED LOCAL: ${localCategories.length}');
      return AppException.handleError((e), data: localCategories);
    }
  }

  void saveMealCategoriesLocally(List<PhotoModel> photos) async {
    final initList = getMealCategoriesLocally();
    final first20 = [
      ...initList,
      ...photos,
    ];
    if (first20.length <= 20) {
      await storage.put(HiveKeys.photos, json.encode(first20));
    }
  }

  List<PhotoModel> getMealCategoriesLocally() {
    var data = storage.get(HiveKeys.photos) ?? [];
    List newdata = json.decode(data);
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
