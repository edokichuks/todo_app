abstract class LocalStorageRepo {
  Future<void> put(dynamic key, dynamic value);
  dynamic get<T>(String key);
  dynamic getAt(int key);
  Future<int> add(dynamic value);
  Future<int> clear();
  Future<void> delete(dynamic value);
  Future<void> putAll(Map<String, dynamic> entries);
}
