// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:todo_app/src/core/extensions/extension_exports.dart';
import 'package:todo_app/src/core/utils/styles/theme_helper.dart';
import 'package:todo_app/src/core/utils/utils_exports.dart';
import 'package:todo_app/src/features/home/widgets/home_app_header.dart';
import 'package:todo_app/src/features/home/widgets/home_card.dart';
import 'package:todo_app/src/features/home/widgets/task_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
        child: Column(
          children: [
            const HomeAppHeader(),
            YMargin(16.h),
            const HomeCard(),
            YMargin(16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today's Task",
                  style: theme.textTheme.s21w700.copyWith(
                      color: AppColors.textColor, fontWeight: FontWeight.w600),
                ),
                Text(
                  "See All",
                  style: theme.textTheme.s16w500
                      .copyWith(color: AppColors.textGreyLight),
                ),
              ],
            ),
            const YMargin(16),
            ListView.separated(
              separatorBuilder: (context, index) {
                return const YMargin(16);
              },
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return const TaskCard();
              },
            ),
          ],
        ),
      ),
    );
  }
}
