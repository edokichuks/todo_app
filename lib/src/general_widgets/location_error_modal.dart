// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:todo_app/src/core/extensions/theme_extensions.dart';
import 'package:todo_app/src/general_widgets/app_button.dart';

class MessageModal extends StatelessWidget {
  const MessageModal({
    super.key,
    required this.message,
    this.text = 'Okay',
    this.onDismissed,
  });
  final String message, text;
  final void Function()? onDismissed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 44.h, right: 35.w, left: 35.w, bottom: 30.h),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: Colors.white,
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 100.w,
              height: 5.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade900,
              ),
            ),
            SizedBox(
              height: 41.h,
            ),
            SvgPicture.asset('assets/svgs/error.svg'),
            SizedBox(
              height: 31.h,
            ),
            Text(
              message,
              style: context.textTheme.s16w400,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 24.h,
            ),
            AppButton(
              width: 160.h,
              text: text,
              onPressed: onDismissed ?? () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }
}

Future<T?> showErrorSnack<T>({
  required String message,
  String text = 'Okay',
  required BuildContext context,
  VoidCallback? onDismissed,
}) {
  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    context: context,
    builder: (context) {
      return MessageModal(
        message: message,
        onDismissed: onDismissed,
        text: text,
      );
    },
  );
}
