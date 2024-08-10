import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/src/core/extensions/extension_exports.dart';
import 'package:todo_app/src/core/utils/styles/theme_helper.dart';
import 'package:todo_app/src/core/utils/utils_exports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey.withOpacity(0.7),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Container(
                height: 48.r,
                width: 48.r,
                decoration: BoxDecoration(
                  color: AppColors.grey04,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  Icons.dashboard,
                  color: AppColors.grey05.withOpacity(0.8),
                ),
              ),
              trailing: Container(
                height: 48.r,
                width: 48.r,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.grey04,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Icon(
                      Icons.notifications,
                      color: AppColors.grey05.withOpacity(0.8),
                    ),
                    Positioned(
                      top: 1.r,
                      right: 2.r,
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 4.r,
                        // minRadius: 4,
                      ),
                    )
                  ],
                ),
              ),
              title: Center(
                child: Text(
                  'Homepage',
                  style: theme.textTheme.s22w600.copyWith(
                    color: AppColors.textColor,
                  ),
                ),
              ),
            ),
            YMargin(16.h),
            const HomeCard(),
            YMargin(16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today's Task",
                  style: theme.textTheme.s21w700.copyWith(
                      color: AppColors.textColor, fontWeight: FontWeight.w600),
                ),
                Text(
                  "See All",
                  style: theme.textTheme.s16w500
                      .copyWith(color: AppColors.textGreyLight),
                ),
              ],
            ),
            const YMargin(16),
            ListView.separated(
              separatorBuilder: (context, index) {
                return const YMargin(16);
              },
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return const TaskCard();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: ListTile(
        leading: Container(
          height: 48.r,
          width: 48.r,
          decoration: BoxDecoration(
            color: AppColors.grey04,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(
            Icons.dashboard,
            color: AppColors.grey05.withOpacity(0.8),
          ),
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right_outlined,
          color: AppColors.grey05,
          size: 32.r,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'UI Desgin',
              style: theme.textTheme.s18w600.copyWith(
                color: AppColors.textColor,
              ),
            ),
            Text(
              '9:00AM - 11:00AM',
              style: theme.textTheme.s13w400.copyWith(
                color: AppColors.grey03,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
