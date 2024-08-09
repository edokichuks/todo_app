// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';

// Project imports:
import 'package:todo_app/src/core/extensions/theme_extensions.dart';
import 'package:todo_app/src/core/extensions/widget_extensions.dart';
import 'package:todo_app/src/core/utils/colors.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    required this.imageUrl,
    super.key,
    this.radius = 19,
    this.initials = '',
    this.fontSize = 16,
    this.color = AppColors.white,
  });
  final double radius;
  final String imageUrl;
  final Color color;
  final String initials;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: imageUrl.isNotEmpty
          ? CachedNetworkImageProvider(
              imageUrl,
            )
          : null,
      child: imageUrl.isEmpty && initials.isNotEmpty
          ? Text(
              initials.substring(0, 2).toUpperCase(),
              style: context.textTheme.s16w500.copyWith(
                color: AppColors.frodorOrange,
                fontWeight: FontWeight.w700,
                fontSize: fontSize,
              ),
            )
          : null,
    ).withContainer(
      shape: BoxShape.circle,
      border: Border.all(
        color: color,
        width: 2,
      ),
    );
  }
}
