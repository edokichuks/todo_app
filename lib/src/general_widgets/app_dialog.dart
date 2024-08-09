// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDialog extends StatefulWidget {
  const AppDialog({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<AppDialog> createState() => _MessageDialogState();
}

class _MessageDialogState extends State<AppDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 58.h),
        child: widget.child,
      ),
    );
  }
}
