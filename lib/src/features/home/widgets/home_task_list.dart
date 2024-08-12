// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:todo_app/src/core/utils/utils_exports.dart';
import 'package:todo_app/src/features/home/widgets/task_card.dart';
import 'package:todo_app/src/features/task/model/task_model.dart';
import 'package:todo_app/src/features/task/notifiers/task_notifier.dart';
import 'package:todo_app/src/general_widgets/general_widget_exports.dart';

class TaskList extends ConsumerStatefulWidget {
  const TaskList({
    super.key,
  });

  @override
  ConsumerState<TaskList> createState() => _TaskListState();
}

class _TaskListState extends ConsumerState<TaskList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        ref.read(taskNotifierProvider.notifier).retrieveFromLocal();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      List<TaskModel> mainList = ref.watch(taskNotifierProvider.select(
        (value) => value.taskList,
      ));

      return mainList.isEmpty
          ? const EmptyListWidget()
          : ListView.separated(
              separatorBuilder: (context, index) {
                return const YMargin(16);
              },
              physics: const NeverScrollableScrollPhysics(),
              itemCount: mainList.length,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                final singleTask = mainList[index];

                return TaskCard(
                  model: singleTask,
                  onTap: () {
                    ref
                        .read(taskNotifierProvider.notifier)
                        .removeTask(model: singleTask);
                    setState(() {});
                  },
                );
              },
            );
    });
  }
}
