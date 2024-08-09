import 'package:flutter/material.dart';
import 'package:todo_app/src/core/utils/styles/theme_helper.dart';


class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    Key? key,
    this.alignment,
    this.margin,
    this.width,
    this.height,
    this.padding,
    this.decoration,
    this.child,
    this.onTap,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final EdgeInsetsGeometry? margin;

  final double? width;

  final double? height;

  final EdgeInsetsGeometry? padding;

  final BoxDecoration? decoration;

  final Widget? child;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: iconButtonWidget,
          )
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => Padding(
        padding: margin ?? EdgeInsets.zero,
        child: IconButton(
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          iconSize: height ?? 0,
          padding: const EdgeInsets.all(0),
          icon: Container(
            alignment: Alignment.center,
            width: width ?? 0,
            height: height ?? 0,
            padding: padding ?? EdgeInsets.zero,
            decoration: decoration ??
                BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    20.00,
                  ),
                  border: Border.all(
                    color: appTheme.gray10002,
                    width: 1.00,
                  ),
                ),
            child: child,
          ),
          onPressed: onTap,
        ),
      );
}

/// Extension on [CustomIconButton] to facilitate inclusion of all types of border style etc
extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get outlineBlack900 => BoxDecoration(
        color: theme.colorScheme.onErrorContainer,
        borderRadius: BorderRadius.circular(
          25.00,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.05),
            spreadRadius: 2.00,
            blurRadius: 2.00,
            offset: const Offset(
              3,
              3,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineOnError => BoxDecoration(
        borderRadius: BorderRadius.circular(
          16.00,
        ),
        border: Border.all(
          color: theme.colorScheme.onError,
          width: 1.00,
        ),
      );
  static BoxDecoration get fillBlue5001 => BoxDecoration(
        color: appTheme.blue5001,
        borderRadius: BorderRadius.circular(
          17.00,
        ),
      );
  static BoxDecoration get fillYellow800 => BoxDecoration(
        color: appTheme.yellow800,
        borderRadius: BorderRadius.circular(
          16.00,
        ),
      );
  static BoxDecoration get fillOnError => BoxDecoration(
        color: theme.colorScheme.onError,
        borderRadius: BorderRadius.circular(
          16.00,
        ),
      );
  static BoxDecoration get fillBluegray100 => BoxDecoration(
        color: appTheme.blueGray100,
        borderRadius: BorderRadius.circular(
          16.00,
        ),
      );
}
