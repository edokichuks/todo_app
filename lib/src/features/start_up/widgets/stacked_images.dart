// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:todo_app/src/core/utils/styles/theme_helper.dart';
import 'package:todo_app/src/general_widgets/custom_icon_button.dart';
import 'package:todo_app/src/general_widgets/general_widget_exports.dart';

class ImageStack extends StatelessWidget {
  const ImageStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 215.h,
      width: 293.w,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          AppImageView(
            imagePath: 'assets/png/table.png',
            height: 184.h,
            width: 260.w,
            alignment: Alignment.bottomLeft,
            margin: const EdgeInsets.only(
              left: 12,
            ),
          ),
          CustomIconButton(
            height: 50.h,
            width: 50.w,
            padding: EdgeInsets.all(13.r),
            decoration: IconButtonStyleHelper.outlineBlack900,
            alignment: Alignment.topRight,
            child: AppImageView(
              svgPath: 'assets/svgs/book.svg',
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.only(
                left: 10.w,
                top: 9.h,
                right: 10.w,
                bottom: 9.h,
              ),
              decoration: BoxDecoration(
                color: theme.colorScheme.onErrorContainer,
                borderRadius: BorderRadius.circular(
                  25.r,
                ),
                boxShadow: [
                  BoxShadow(
                    color: appTheme.black900.withOpacity(0.05),
                    spreadRadius: 2.r,
                    blurRadius: 2.r,
                    offset: Offset(
                      5.w,
                      5.h,
                    ),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 8.h,
                    width: 28.w,
                    margin: EdgeInsets.only(
                      top: 3.h,
                    ),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 7.h,
                            width: 28.w,
                            decoration: BoxDecoration(
                              color: appTheme.lightBlue800.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(
                                2.r,
                              ),
                            ),
                          ),
                        ),
                        AppImageView(
                          svgPath: 'assets/svgs/checkmark.svg',
                          height: 8.r,
                          width: 8.r,
                          alignment: Alignment.centerLeft,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 8.r,
                    width: 28.r,
                    margin: EdgeInsets.only(
                      top: 1.r,
                    ),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 7.h,
                            width: 28.w,
                            decoration: BoxDecoration(
                              color: appTheme.blue300,
                              borderRadius: BorderRadius.circular(
                                2.r,
                              ),
                            ),
                          ),
                        ),
                        AppImageView(
                          svgPath: 'assets/svgs/checkmark.svg',
                          height: 8,
                          width: 8,
                          alignment: Alignment.centerLeft,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 8.h,
                    width: 28.w,
                    margin: EdgeInsets.only(
                      top: 1.r,
                    ),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 7.h,
                            width: 28.w,
                            decoration: BoxDecoration(
                              color: appTheme.blue50,
                              borderRadius: BorderRadius.circular(
                                2.r,
                              ),
                            ),
                          ),
                        ),
                        AppImageView(
                          svgPath: 'assets/svgs/checkmark_outline.svg',
                          height: 8.r,
                          width: 8.r,
                          alignment: Alignment.centerLeft,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
