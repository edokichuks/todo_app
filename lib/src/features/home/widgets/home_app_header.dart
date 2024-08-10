// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:todo_app/src/core/extensions/extension_exports.dart';
import 'package:todo_app/src/core/utils/styles/theme_helper.dart';
import 'package:todo_app/src/core/utils/utils_exports.dart';

class HomeAppHeader extends StatelessWidget {
  const HomeAppHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
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
      trailing: Container(
        height: 48.r,
        width: 48.r,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.grey04,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Icon(
              Icons.notifications,
              color: AppColors.grey05.withOpacity(0.8),
            ),
            Positioned(
              top: 1.r,
              right: 2.r,
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 4.r,
                // minRadius: 4,
              ),
            )
          ],
        ),
      ),
      title: Center(
        child: Text(
          'Homepage',
          style: theme.textTheme.s22w600.copyWith(
            color: AppColors.textColor,
          ),
        ),
      ),
    );
  }
}
