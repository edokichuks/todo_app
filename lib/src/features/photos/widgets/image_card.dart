// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:todo_app/src/core/extensions/extension_exports.dart';
import 'package:todo_app/src/core/utils/styles/theme_helper.dart';
import 'package:todo_app/src/core/utils/utils_exports.dart';
import 'package:todo_app/src/general_widgets/general_widget_exports.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({super.key, required this.imageURL, required this.title});
  final String imageURL, title;

  @override
  Widget build(BuildContext context) {
    double w = width(context);
    return Container(
      width: w / 2.36,
      // height: w / 1.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 50),
          const BoxShadow(
            blurRadius: 2,
            spreadRadius: 2,
            color: AppColors.grey08,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppImageView(
            height: w / 3.2,
            width: w,
            radius: BorderRadius.vertical(
              top: Radius.circular(20.r),
            ),
            url: imageURL,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              title,
              // ignore: deprecated_member_use
              textScaleFactor: 1.2,
              maxLines: 2,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.s12w500,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
