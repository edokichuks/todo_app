// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

// Project imports:
import 'package:todo_app/src/core/extensions/extension_exports.dart';
import 'package:todo_app/src/core/utils/styles/theme_helper.dart';
import 'package:todo_app/src/core/utils/utils_exports.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 200.h,
            child: Lottie.asset(
              'assets/animations/emptyList.json',
              alignment: Alignment.center,
              animate: true,
              repeat: true,
              fit: BoxFit.contain,
            ),
          ),
          const YMargin(16),
          Text(
            'No todo items yet. Add some with the plus button',
            style: theme.textTheme.s14w500,
          )
        ],
      ),
    );
  }
}
