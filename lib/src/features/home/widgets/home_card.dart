// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:todo_app/src/core/extensions/extension_exports.dart';
import 'package:todo_app/src/core/utils/styles/theme_helper.dart';
import 'package:todo_app/src/core/utils/utils_exports.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 300,
      height: 150.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xff87CEEB),
            const Color(0xff87CEEB).withOpacity(0.7),
            const Color(0xff0066CC).withOpacity(0.9),
          ],

          stops: const [0.4, 0.4, 0.6], // Define the position of each color
        ),
      ),
      padding: EdgeInsets.all(24.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Today's progress summary",
            style: theme.textTheme.s21w700.copyWith(color: AppColors.white),
          ),
          SizedBox(height: 4.h),
          Text(
            '15 Tasks',
            style: theme.textTheme.s16w500.copyWith(color: AppColors.white),
          ),
          const YMargin(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Stack(
                children: [
                  // ProfileAvatar2(),
                  ProfileAvatar(
                    margein: 0,
                    imagePath: 'assets/png/2.jpg',
                  ),
                  ProfileAvatar(
                    margein: 20,
                    imagePath: 'assets/png/3.jpg',
                  ),
                  ProfileAvatar(
                    margein: 40,
                    imagePath: 'assets/png/4.jpg',
                  ),
                  ProfileAvatar(
                    margein: 60,
                    isLast: true,
                    imagePath: 'assets/png/4.jpg',
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: width(context) * 0.4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Progress',
                          style: theme.textTheme.s16w500
                              .copyWith(color: AppColors.white),
                        ),
                        Text(
                          '40%',
                          style: theme.textTheme.s16w500
                              .copyWith(color: AppColors.white),
                        ),
                      ],
                    ),
                  ),
                  const YMargin(4),
                  SizedBox(
                    width: width(context) * 0.4,
                    child: LinearProgressIndicator(
                      minHeight: 8.h,
                      borderRadius: BorderRadius.circular(32.r),
                      backgroundColor: AppColors.d9grey.withOpacity(0.3),
                      value: 0.4,
                      color: AppColors.grey,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    required this.margein,
    required this.imagePath,
    this.isLast = false,
  });
  final double margein;
  final String imagePath;
  final bool? isLast;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      backgroundImage: !(isLast ?? false) ? AssetImage(imagePath) : null,
      radius: 18.r,
      child: isLast ?? false
          ? const Icon(
              CupertinoIcons.add,
              color: AppColors.primary,
            )
          : null,
    ).withContainer(
      margin: EdgeInsets.only(left: margein),
      shape: BoxShape.circle,
      border: Border.all(
        color: Colors.white,
        width: 2,
      ),
    );
  }
}
