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

  final Ref _ref;
  // ignore: unused_field
  final RestClient _restClient;

  // @override
  // User getUser() {
  //   final response = _storage.get<String?>(HiveKeys.user);
  //   final user = User.fromJson(
  //     response == null
  //         ? {}
  //         : json.decode(response as String) as Map<String, dynamic>,
  //   );
  //   return user;
  // }

  // @override
  // Future<void> updateUser(User user) async {
  //   await _storage.put(HiveKeys.user, json.encode(user));
  //   _ref.read(currentUserProvider.notifier).state = user;
  // }

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

  @override
  String getFCMToken() {
    return _storage.get(HiveKeys.fcmToken) ?? "";
  }

  @override
  void saveFCMTokenLocally(String val) async {
    await _storage.put(HiveKeys.fcmToken, val);
  }

  // @override
  // Future<BaseResponse<User>> getUserProfile() async {
  //   try {
  //     final r = await _restClient.getUserProfile();
  //     await updateUser(r.data!);
  //     return r;
  //   } on DioException catch (e) {
  //     return AppException.handleError(e);
  //   }
  // }

  // @override
  // Future<BaseResponse<User>> updateUserProfile(
  //     {required UpdateUserModel data, required String userId}) async {
  //   try {
  //     final r = await _restClient.updateUser(data, userId);
  //     await updateUser(r.data!);
  //     return r;
  //   } on DioException catch (e) {
  //     return AppException.handleError(e);
  //   }
  // }

  @override
  bool getBalanceVisibility() {
    return _storage.get(HiveKeys.balanceVisibility) ?? true;
  }

  @override
  void setBalanceVisibility() async {
    final visible = _storage.get(HiveKeys.balanceVisibility) ?? true;
    await _storage.put(HiveKeys.balanceVisibility, !visible);
    _ref.read(walletBalanceVisibility.notifier).state = !visible;
  }
}

final userRepositoryProvider = Provider<UserRepository>(
  (ref) => UserRepositoryImpl(ref.read(localDB), ref, ref.read(restClient)),
);

// final currentUserProvider = StateProvider<User>((ref) {
//   final user = ref.read(userRepositoryProvider).getUser();
//   return user;
// });

final walletBalanceVisibility = StateProvider<bool>(
  (ref) => ref.read(userRepositoryProvider).getBalanceVisibility(),
);
