// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import '../core/utils/colors.dart';

class AppBackButton extends StatelessWidget {
  final VoidCallback? callback;
  final bool clear;
  final bool hasShadow;
  const AppBackButton(
      {super.key, this.callback, this.clear = false, this.hasShadow = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback ??
          () {
            Navigator.pop(context);
          },
      child: Container(
        height: 30.h,
        width: 30.w,
        decoration: BoxDecoration(
            boxShadow: hasShadow
                ? [
                    BoxShadow(
                        color: AppColors.frodorBlack.withOpacity(0.25),
                        spreadRadius: 0,
                        blurRadius: 14,
                        offset: const Offset(-11, 1))
                  ]
                : null,
            color: AppColors.grey04,
            shape: BoxShape.circle),
        child: Icon(
          clear ? Icons.clear : Icons.arrow_back,
          color: AppColors.grey800,
          size: 19,
        ),
      ),
    );
  }
}
