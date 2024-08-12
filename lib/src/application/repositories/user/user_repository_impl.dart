// Dart imports:

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:todo_app/src/application/repositories/user/user_repository.dart';
import 'package:todo_app/src/core/services/client/rest_client.dart';
import 'package:todo_app/src/core/services/local_storage.dart/local_storage_repo.dart';
import 'package:todo_app/src/core/services/local_storage.dart/local_storage_repo_impl.dart';
import 'package:todo_app/src/core/services/local_storage.dart/storage_keys.dart';
import 'package:todo_app/src/core/utils/enums.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(
    this._storage,
    this._ref,
    this._restClient,
  );
  final LocalStorageRepo _storage;

  // ignore: unused_field
  final Ref _ref;
  // ignore: unused_field
  final RestClient _restClient;
  @override
  Future<void> saveRememberMe(bool value) async {
    await _storage.put(HiveKeys.rememberMe, value);
  }

  @override
  bool? getRememberMe() {
    final rememberMe = _storage.get<bool?>(HiveKeys.rememberMe);
    if (rememberMe is bool?) {
      return rememberMe;
    }
    return null;
  }

  @override
  CurrentState getCurrentState() {
    switch (_storage.get(HiveKeys.currentState) ?? CurrentState.initial.name) {
      case "onboarded":
        return CurrentState.onboarded;

      case "loggedIn":
        return CurrentState.loggedIn;
      default:
        return CurrentState.initial;
    }
  }

  @override
  void saveCurrentState(CurrentState val) async {
    await _storage.put(HiveKeys.currentState, val.name);
  }

  @override
  String getToken() {
    return _storage.get(HiveKeys.token) ?? '';
  }

  @override
  void saveToken(String token) async {
    await _storage.put(HiveKeys.token, token);
  }

  @override
  String getRefreshToken() {
    return _storage.get(HiveKeys.refreshToken) ?? '';
  }

  @override
  void saveRefreshToken(String token) async {
    await _storage.put(HiveKeys.refreshToken, token);
  }
}

final userRepositoryProvider = Provider<UserRepository>(
  (ref) => UserRepositoryImpl(ref.read(localDB), ref, ref.read(restClient)),
);
