// ignore_for_file: unnecessary_null_comparison

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

/// Basic layout for indicating that an exception occurred.
class ExceptionIndicator extends StatelessWidget {
  const ExceptionIndicator({
    required this.title,
    required this.assetName,
    required this.message,
    super.key,
    this.retryWidget,
  });
  final String title;
  final String message;
  final String assetName;
  final Widget? retryWidget;

  @override
  Widget build(BuildContext context) => Center(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * .50,
              child: Column(
                children: [
                  SizedBox(
                    height: 200.h,
                    child: Lottie.asset(
                      assetName,
                      alignment: Alignment.center,
                      animate: true,
                      repeat: true,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  if (message != null)
                    SizedBox(
                      height: 8.h,
                    ),
                  if (message != null)
                    Text(
                      message,
                      textAlign: TextAlign.center,
                    ),
                  SizedBox(
                    height: 16.h,
                  ),
                  retryWidget ?? const SizedBox.shrink(),
                  SizedBox(
                    height: 16.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
