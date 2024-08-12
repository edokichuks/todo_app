// Dart imports:

// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:todo_app/src/core/services/local_storage.dart/local_storage_export.dart';
import 'package:todo_app/src/features/task/model/task_model.dart';

// Project imports:

final class TaskRepository {
  TaskRepository({
    required this.storage,
  });

  final LocalStorageRepo storage;

  void saveTaskList(List<TaskModel> tasks) async {
     List<Map<String, dynamic>> taskJsonList =
        tasks.map((task) => task.toJson()).toList();
    await storage.put(HiveKeys.tasks, json.encode(taskJsonList));
  }

  List<TaskModel> getSavedTask() {
    var data = storage.get(HiveKeys.tasks) ?? [];
    List newdata;
    if (data is String) {
      newdata = json.decode(data) as List;
    } else if (data is List) {
      newdata = data;
    } else {
      newdata = [];
    }
    var tasks = List<TaskModel>.from(newdata.map((e) => TaskModel.fromJson(e)))
        .toList();
    return tasks;
  }
}

final taskRepoProvider = Provider<TaskRepository>((_) {
  return TaskRepository(
    storage: _.read(localDB),
  );
});
