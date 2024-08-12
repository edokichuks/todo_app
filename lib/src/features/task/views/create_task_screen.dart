// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:todo_app/src/core/extensions/extension_exports.dart';
import 'package:todo_app/src/core/utils/styles/theme_helper.dart';
import 'package:todo_app/src/core/utils/utils_exports.dart';
import 'package:todo_app/src/features/task/model/task_model.dart';
import 'package:todo_app/src/features/task/notifiers/task_notifier.dart';
import 'package:todo_app/src/features/task/widgets/chip_tabs.dart';
import 'package:todo_app/src/features/task/widgets/create_new_task_textfields.dart';
import 'package:todo_app/src/features/task/widgets/create_task_app_bar.dart';
import 'package:todo_app/src/general_widgets/general_widget_exports.dart';

class CreateTaskScreen extends ConsumerStatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  ConsumerState<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends ConsumerState<CreateTaskScreen> {
  final dateContrl = TextEditingController();
  final titleContrl = TextEditingController();
  final startTimeContrl = TextEditingController();
  final endTimeContrl = TextEditingController();

  @override
  void dispose() {
    dateContrl.dispose();
    titleContrl.dispose();
    startTimeContrl.dispose();
    endTimeContrl.dispose();
    super.dispose();
  }

  void createTask() async {
    final id = Random().nextInt(1000000);
    final taskData = TaskModel(
        id: id,
        endTime: endTimeContrl.text,
        startTime: startTimeContrl.text,
        title: titleContrl.text,
        completed: false,
        firstItem: false);
    await ref
        .read(taskNotifierProvider.notifier)
        .createTask(model: taskData)
        .then((value) {
      AppOverLay.of(context).showMessage(
          message: 'Task Successfully created',
          messageType: MessageType.success,
          title: 'Success');
      final taskState = ref.watch(taskNotifierProvider);
      if (taskState.loadState.isLoaded) {
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final taskState = ref.watch(taskNotifierProvider);
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CreateTaskHeader(),
              const YMargin(24),
              Text(
                'Task Name',
                style: theme.textTheme.s22w600.copyWith(
                  color: AppColors.textColor,
                ),
              ),
              const YMargin(12),
              TaskNameTextField(
                contrl: titleContrl,
              ),
              const YMargin(24),
              Text(
                'Category',
                style: theme.textTheme.s22w600.copyWith(
                  color: AppColors.textColor,
                ),
              ),
              const YMargin(12),
              const ChipTabs(),
              const YMargin(24),
              Text(
                'Date & Time',
                style: theme.textTheme.s22w600.copyWith(
                  color: AppColors.textColor,
                ),
              ),
              const YMargin(12),
              DateTextField(dateContrl: dateContrl),
              const YMargin(16),
              StartEndTimeWidget(
                  startTimeContrl: startTimeContrl,
                  endTimeContrl: endTimeContrl),
              const YMargin(24),
              Text(
                'Description',
                style: theme.textTheme.s22w600.copyWith(
                  color: AppColors.textColor,
                ),
              ),
              const YMargin(12),
              const DescTextField(),
              const YMargin(24),
              AppButton(
                text: 'Create Task',
                onPressed: () => createTask(),
                isEnabled: true,
                isLoading: taskState.loadState.isLoading,
              ),
              const YMargin(24),
            ],
          ),
        ),
      ),
    );
  }
}
