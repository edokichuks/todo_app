// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:todo_app/src/core/extensions/extension_exports.dart';
import 'package:todo_app/src/core/utils/styles/theme_helper.dart';
import 'package:todo_app/src/core/utils/utils_exports.dart';

class CreateTaskHeader extends StatelessWidget {
  const CreateTaskHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: Container(
          height: 48.r,
          width: 48.r,
          decoration: BoxDecoration(
            color: AppColors.grey04,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(
            Icons.keyboard_arrow_left,
            color: AppColors.grey05,
            size: 32.r,
          ),
        ),
      ),
      title: Center(
        child: Text(
          'Create new task',
          style: theme.textTheme.s22w600.copyWith(
            color: AppColors.textColor,
          ),
        ),
      ),
    );
  }
}
