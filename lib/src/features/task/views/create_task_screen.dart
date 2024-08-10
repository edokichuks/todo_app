// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:todo_app/src/core/extensions/extension_exports.dart';
import 'package:todo_app/src/core/utils/styles/theme_helper.dart';
import 'package:todo_app/src/core/utils/utils_exports.dart';
import 'package:todo_app/src/features/task/widgets/chip_tabs.dart';
import 'package:todo_app/src/features/task/widgets/create_new_task_textfields.dart';
import 'package:todo_app/src/features/task/widgets/create_task_app_bar.dart';
import 'package:todo_app/src/general_widgets/app_button.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final dateContrl = TextEditingController();
  final startTimeContrl = TextEditingController();
  final endTimeContrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
              const TaskNameTextField(),
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
              AppButton(text: 'Create Task', onPressed: () {}),
              const YMargin(24),
            ],
          ),
        ),
      ),
    );
  }
}
