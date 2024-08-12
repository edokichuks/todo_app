// Flutter imports:

// Dart imports:

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:todo_app/src/application/repositories/task/task_repo.dart';
import 'package:todo_app/src/core/utils/utils_exports.dart';
import 'package:todo_app/src/features/task/model/task_model.dart';
import 'package:todo_app/src/features/task/notifiers/task_state.dart';

class TaskNotifier extends AutoDisposeNotifier<TaskState> {
  TaskNotifier();

  late TaskRepository _taskRepository;

  @override
  TaskState build() {
    _taskRepository = ref.read(taskRepoProvider);
    return TaskState.initial();
  }

  Future<void> createTask({required TaskModel model}) async {
    //!Simulating API calls to create tasks
    state = state.copyWith(loadState: LoadState.loading);
    debugLog('Task data coming in ${model.toString()}');
    final iniTask = _taskRepository.getSavedTask();

    _taskRepository.saveTaskList([...iniTask, model]);

    await Future.delayed(const Duration(seconds: 1), () {
      state = state.copyWith(
          loadState: LoadState.success, tasks: [...state.taskList, model]);
    });
    debugLog('Task List from state ${state.taskList}');
    calculateTaskProgress();
  }

  void retrieveFromLocal() {
    debugLog('Retrieving from local');
    final iniTask = _taskRepository.getSavedTask();
    state = state.copyWith(tasks: iniTask);
    calculateTaskProgress();
  }

  void removeTask({required TaskModel model}) {
    List<TaskModel> task = state.taskList;
    task.remove(model);
    state = state.copyWith(tasks: task);
    _taskRepository.saveTaskList(task);
    calculateTaskProgress();
  }

  void updateTask({required TaskModel model, required bool completed}) {
    List<TaskModel> task = state.taskList;
    task.removeWhere((t) => t.id == model.id);
    final updatedModel = model.copyWith(completed: completed);
    debugLog('updated mode ${updatedModel.toString()}');
    task.add(updatedModel);
    state = state.copyWith(tasks: task);
    _taskRepository.saveTaskList(task);
    calculateTaskProgress();
  }

  void calculateTaskProgress() {
    int completedTasks =
        state.taskList.where((task) => task.completed ?? false).length;
    int totalTasks = state.taskList.length;
    double progress = (completedTasks / totalTasks) * 100;
    debugLog('Progress: $progress');
    state = state.copyWith(progress: int.parse(progress.floor().toString()));
  }
}

final taskNotifierProvider =
    NotifierProvider.autoDispose<TaskNotifier, TaskState>(TaskNotifier.new);
