// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:todo_app/src/core/extensions/extension_exports.dart';
import 'package:todo_app/src/core/utils/styles/theme_helper.dart';
import 'package:todo_app/src/core/utils/utils_exports.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            color: AppColors.grey04,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(
            Icons.dashboard,
            color: AppColors.grey05.withOpacity(0.8),
          ),
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right_outlined,
          color: AppColors.grey05,
          size: 32.r,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'UI Desgin',
              style: theme.textTheme.s18w600.copyWith(
                color: AppColors.textColor,
              ),
            ),
            Text(
              '9:00AM - 11:00AM',
              style: theme.textTheme.s13w400.copyWith(
                color: AppColors.grey03,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
