// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:todo_app/src/core/extensions/extension_exports.dart';
import 'package:todo_app/src/core/utils/app_date_picker.dart';
import 'package:todo_app/src/core/utils/app_time_picker.dart';
import 'package:todo_app/src/core/utils/styles/theme_helper.dart';
import 'package:todo_app/src/core/utils/utils_exports.dart';

class DescTextField extends StatelessWidget {
  const DescTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        maxLines: 2,
        decoration: InputDecoration(
          hintText:
              'Research design paths. There are many career paths within the field of design...',
          hintMaxLines: 2,
          hintStyle: const TextStyle(color: AppColors.borderGrey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(
              color: AppColors.borderGrey,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.borderGrey,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
        ));
  }
}

class StartEndTimeWidget extends StatelessWidget {
  const StartEndTimeWidget({
    super.key,
    required this.startTimeContrl,
    required this.endTimeContrl,
  });

  final TextEditingController startTimeContrl;
  final TextEditingController endTimeContrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            width: width(context) * 0.4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Start Time',
                  style: theme.textTheme.s22w600.copyWith(
                    color: AppColors.textColor,
                  ),
                ),
                const YMargin(12),
                GestureDetector(
                  onTap: () async {
                    startTimeContrl.text =
                        await openTimePicker(context: context) ??
                            DateTime.now().toTime;
                  },
                  child: TextFormField(
                      controller: startTimeContrl,
                      enabled: false,
                      decoration: InputDecoration(
                        hintText: '9:00AM',
                        suffixIcon: Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.primary,
                          size: 32.r,
                        ),
                        hintStyle: const TextStyle(color: AppColors.borderGrey),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: const BorderSide(
                            color: AppColors.borderGrey,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColors.borderGrey,
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
        const XMargin(12),
        Expanded(
          child: SizedBox(
            width: width(context) * 0.4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'End Time',
                  style: theme.textTheme.s22w600.copyWith(
                    color: AppColors.textColor,
                  ),
                ),
                const YMargin(12),
                GestureDetector(
                  onTap: () async {
                    endTimeContrl.text =
                        await openTimePicker(context: context) ??
                            DateTime.now().toTime;
                  },
                  child: TextFormField(
                      controller: endTimeContrl,
                      enabled: false,
                      decoration: InputDecoration(
                        hintText: '9:00AM',
                        suffixIcon: Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.primary,
                          size: 32.r,
                        ),
                        hintStyle: const TextStyle(color: AppColors.borderGrey),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: const BorderSide(
                            color: AppColors.borderGrey,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColors.borderGrey,
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class DateTextField extends StatelessWidget {
  const DateTextField({
    super.key,
    required this.dateContrl,
  });

  final TextEditingController dateContrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        dateContrl.text =
            await openDatePicker(context: context) ?? DateTime.now().toDate;
      },
      child: TextFormField(
          controller: dateContrl,
          enabled: false,
          decoration: InputDecoration(
            hintText: '05 Apirl, Tuesday',
            suffixIcon: Icon(
              Icons.calendar_month,
              color: AppColors.primary,
              size: 16.r,
            ).withContainer(
                height: 28.r,
                width: 28.r,
                alignment: Alignment.center,
                margin: EdgeInsets.only(right: 16.w),
                shape: BoxShape.circle,
                color: AppColors.primary.withOpacity(0.1)),
            hintStyle: const TextStyle(color: AppColors.borderGrey),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(
                color: AppColors.borderGrey,
              ),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.borderGrey,
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
          )),
    );
  }
}

class TaskNameTextField extends StatelessWidget {
  const TaskNameTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
      hintText: 'UI Designs',
      hintStyle: const TextStyle(color: AppColors.borderGrey),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(
          color: AppColors.borderGrey,
        ),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.borderGrey,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
    ));
  }
}
