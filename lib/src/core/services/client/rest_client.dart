// Package imports:
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

// Project imports:
import 'package:todo_app/src/application/repositories/user/user_repository_impl.dart';
import 'package:todo_app/src/core/config/dio_utils.dart/auth_strings.dart';
import 'package:todo_app/src/core/config/dio_utils.dart/header_interceptors.dart';
import 'package:todo_app/src/core/services/local_storage.dart/local_storage_repo_impl.dart';
import 'package:todo_app/src/core/services/local_storage.dart/storage_keys.dart';
import 'package:todo_app/src/features/photos/model/photo_model/photo_model.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/photos')
  Future<List<PhotoModel>> getAllPhotos(
    @Queries() Map<String, dynamic> queries,
  );
}

////////////////////////////////////////////////////////////////

final dio = Provider<Dio>((ref) {
  final dio = Dio();
  dio.options.baseUrl = AuthStrings.baseUrl;
  dio.options.headers = {
    'Content-Type': 'application/json',
    "accept": 'application/json'
  };
  dio.interceptors.add(
    HeaderInterceptor(
      dio: dio,
      userRepository: UserRepositoryImpl(
          LocalStorageRepoImpl(Hive.box(HiveKeys.appBox)),
          ref,
          RestClient(dio)),
      ref: ref,
    ),
  );

  return dio;
});

final restClient = Provider<RestClient>((ref) => RestClient(ref.read(dio)));
