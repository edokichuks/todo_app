// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:todo_app/src/core/extensions/navigation_extensions.dart';
import 'package:todo_app/src/core/extensions/theme_extensions.dart';
import '../core/utils/colors.dart';
import 'back_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final String? title;
  final Widget? actions;
  final bool centerTitle;
  final VoidCallback? onBackPressed;

  const CustomAppBar({
    super.key,
    this.leading,
    this.title,
    this.actions,
    this.onBackPressed,
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: SafeArea(
        child: Padding(
          padding: actions != null
              ? const EdgeInsets.only(left: 20, right: 20)
              : const EdgeInsets.only(left: 20),
          child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                leading ??
                    AppBackButton(
                      callback: onBackPressed ?? () => context.pop(),
                    ),
                if (title == null)
                  const SizedBox.shrink()
                else
                  Expanded(
                    child: Center(
                      child: Text(
                        title!,
                        textAlign: TextAlign.center,
                        style: context.textTheme.s21w700.copyWith(
                          color: AppColors.dark,
                        ),
                      ),
                    ),
                  ),
                actions ??
                    Container(
                      width: 38.w,
                    )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
