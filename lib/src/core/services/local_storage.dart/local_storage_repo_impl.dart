// Dart imports:
import 'dart:async';

// Package imports:
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:todo_app/src/core/services/local_storage.dart/local_storage_repo.dart';
import 'package:todo_app/src/core/services/local_storage.dart/storage_keys.dart';

class LocalStorageRepoImpl implements LocalStorageRepo {
  LocalStorageRepoImpl(this.box);
  final Box box;
  @override
  Future<void> put(dynamic key, dynamic value) async {
    return box.put(key, value);
  }

  @override
  dynamic get<T>(String key) {
    return box.get(key);
  }

  @override
  dynamic getAt(int key) {
    return box.getAt(key);
  }

  @override
  Future<int> add(dynamic value) {
    return box.add(value);
  }

  @override
  Future<int> clear() {
    return box.clear();
  }

  @override
  Future<void> delete(dynamic value) {
    return box.delete(value);
  }

  @override
  Future<void> putAll(Map<String, dynamic> entries) async {
    return box.putAll(entries);
  }
}

final localDB = Provider<LocalStorageRepo>(
  (ref) => LocalStorageRepoImpl(Hive.box(HiveKeys.appBox)),
);
