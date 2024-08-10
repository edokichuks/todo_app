// ignore_for_file: use_key_in_widget_constructors

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:todo_app/src/core/utils/app_dimensions.dart';

class Spacing extends StatelessWidget {
  final double height;
  final double width;

  const Spacing.height(this.height) : width = AppDimensions.zero;

  const Spacing.tinyHeight() : this.height(AppDimensions.tiny);
  const Spacing.smallHeight() : this.height(AppDimensions.small);
  const Spacing.mediumHeight() : this.height(AppDimensions.medium);
  const Spacing.bigHeight() : this.height(AppDimensions.big);
  const Spacing.largeHeight() : this.height(AppDimensions.large);

  const Spacing.width(this.width) : height = AppDimensions.zero;

  const Spacing.tinyWidth() : this.width(AppDimensions.tiny);
  const Spacing.smallWidth() : this.width(AppDimensions.small);
  const Spacing.mediumWidth() : this.width(AppDimensions.medium);
  const Spacing.bigWidth() : this.width(AppDimensions.big);
  const Spacing.largeWidth() : this.width(AppDimensions.large);

  const Spacing.empty()
      : width = AppDimensions.zero,
        height = AppDimensions.zero;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height, width: width);
  }
}
