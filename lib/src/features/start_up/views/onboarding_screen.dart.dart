// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:todo_app/src/core/extensions/extension_exports.dart';
import 'package:todo_app/src/core/services/local_auth/local_auth.dart';
import 'package:todo_app/src/core/utils/styles/theme_helper.dart';
import 'package:todo_app/src/core/utils/utils_exports.dart';
import 'package:todo_app/src/features/dashboard/dashboard.dart';
import 'package:todo_app/src/features/start_up/widgets/stacked_images.dart';
import 'package:todo_app/src/general_widgets/custom_icon_button.dart';
import 'package:todo_app/src/general_widgets/general_widget_exports.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool authenticated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.onErrorContainer,
      body: Container(
        padding: EdgeInsets.only(
          left: 24.w,
          top: 43.h,
          right: 24.w,
          bottom: 16.h,
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter,
            stops: [0.3, 0.55],
            colors: [AppColors.primary, Colors.white],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomIconButton(
              height: 50.r,
              width: 50.r,
              margin: EdgeInsets.only(
                top: 80.h,
              ),
              alignment: Alignment.center,
              decoration: IconButtonStyleHelper.outlineBlack900,
              child: AppImageView(
                svgPath: 'assets/svgs/img_volume.svg',
                fit: BoxFit.cover,
                height: 40.r,
                width: 40.r,
              ),
            ),
            const ImageStack(),
            Padding(
              padding: EdgeInsets.only(
                top: 60.r,
              ),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Welcome to Go Task",
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 28.sp,
                        fontFamily: 'Mark Pro',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    TextSpan(
                      text:
                          "\n\nA workspace to over 10 Million influencers around the global of the world",
                      style: TextStyle(
                        color: AppColors.grey05,
                        fontSize: 16.sp,
                        fontFamily: 'Mark Pro',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const YMargin(70),
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: AppButton(
                    text: "Let's Start",
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const Dashboard(),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: CustomIconButton(
                      height: 56,
                      width: 54,
                      onTap: () async {
                        final auth = await LocalAuth.authenticate();

                        setState(() {
                          authenticated = auth;
                        });
                        if (authenticated) {
                          // ignore: use_build_context_synchronously
                          context.showMessage(
                            message: 'Authenticated With Fingerprint',
                            title: 'Success',
                            messageType: MessageType.success,
                          );
                          Navigator.push(
                            // ignore: use_build_context_synchronously
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const Dashboard(),
                            ),
                          );
                        }
                      },
                      margin: EdgeInsets.only(left: 16.w),
                      padding: EdgeInsets.all(12.r),
                      decoration: IconButtonStyleHelper.outlineOnError,
                      child:
                          AppImageView(svgPath: 'assets/svgs/fingerprint.svg')),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
