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

class TaskCard extends ConsumerStatefulWidget {
  const TaskCard({
    super.key,
    required this.model,
    required this.onTap,
  });
  final TaskModel model;
  final VoidCallback onTap; // Define the onTap callback

  @override
  ConsumerState<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends ConsumerState<TaskCard> {
  bool done = false;
  Color color = Colors.grey;
  Color getRandomColor() {
    final random = Random();
    return Color.fromRGBO(
      random.nextInt(256), // Red value
      random.nextInt(256), // Green value
      random.nextInt(256), // Blue value
      (random.nextDouble() * 256).clamp(50, 100), // Alpha value (opacity)
    );
  }

  @override
  void initState() {
    super.initState();

    done = widget.model.completed ?? false;
    color = getRandomColor();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(taskNotifierProvider.notifier);
    return Dismissible(
      key: ValueKey(widget.model.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      onDismissed: (direction) {
        widget.onTap();
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                blurRadius: 2,
                spreadRadius: 2,
                color: AppColors.grey08,
              )
            ]),
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: ListTile(
          leading: Container(
            height: 48.r,
            width: 48.r,
            decoration: BoxDecoration(
              // color: AppColors.grey04,
              color: getRandomColor().withOpacity(0.5),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: const Icon(
              Icons.dashboard,
              color: Color.fromARGB(255, 241, 240, 240),
            ),
          ),
          trailing: widget.model.firstItem ?? false
              ? Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: AppColors.grey05,
                  size: 32.r,
                )
              : Checkbox(
                  value: done,
                  checkColor: AppColors.white,
                  onChanged: (value) {
                    setState(() {
                      done = value ?? false;
                    });
                    notifier.updateTask(
                      model: widget.model,
                      completed: done,
                    );
                  }),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.model.firstItem ?? false
                    ? 'UI Desgin'
                    : (widget.model.title.nullIfEmpty ?? 'Complete App')
                        .capitalizeFullname,
                style: theme.textTheme.s18w600.copyWith(
                  color: AppColors.textColor,
                ),
                maxLines: 1,
              ),
              Text(
                widget.model.firstItem ?? false
                    ? '9:00AM - 11:00AM'
                    : '${widget.model.startTime.nullIfEmpty ?? '0:00AM'} - ${widget.model.endTime.nullIfEmpty ?? '1:00AM'}',
                style: theme.textTheme.s13w400.copyWith(
                  color: AppColors.grey03,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
