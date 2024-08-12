// Project imports:
import 'package:todo_app/src/core/utils/enums.dart';
import 'package:todo_app/src/features/task/model/task_model.dart';

class TaskState {
  TaskState({
    required this.loadState,
    required this.taskList,
    required this.errorMessage,
    required this.progress,
  });
  factory TaskState.initial() {
    return TaskState(
      loadState: LoadState.idle,
      taskList: [
        const TaskModel(firstItem: true),
      ],
      errorMessage: '',
      progress: 0,
    );
  }

  final LoadState loadState;
  final String errorMessage;
  final List<TaskModel> taskList;
  final int progress;

  TaskState copyWith({
    LoadState? loadState,
    List<TaskModel>? tasks,
    String? errorMessage,
    int? progress,
  }) {
    return TaskState(
      loadState: loadState ?? this.loadState,
      taskList: tasks ?? taskList,
      errorMessage: errorMessage ?? this.errorMessage,
      progress: progress ?? this.progress,
    );
  }
}
