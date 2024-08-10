// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:todo_app/src/core/utils/styles/theme_helper.dart';
import 'package:todo_app/src/general_widgets/general_widget_exports.dart';
import 'package:todo_app/src/general_widgets/spacing.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppImageView(
            svgPath: 'assets/svgs/app_logo.svg', height: 21.r, width: 21.r),
        const Spacing.smallWidth(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "TODO",
              style: TextStyle(
                color: theme.colorScheme.onError,
                fontSize: 33.sp,
                fontFamily: 'Mark Pro',
                fontWeight: FontWeight.w700,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: 45.w,
                child: Divider(
                  height: 2.h,
                  thickness: 2.r,
                  color: theme.colorScheme.onError,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
