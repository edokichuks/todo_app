// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:todo_app/src/core/extensions/theme_extensions.dart';
import 'package:todo_app/src/core/utils/styles/app_button_styles.dart';
import 'package:todo_app/src/general_widgets/app_loader.dart';

/// A custom Frodor button. This was built to adapt to the our in-house button style.
/// Works similarly to default flutter button except for its aesthetic changes.
/// It currently support various AppButtonStyles
/// [AppButtonStyle.primary],
/// [AppButtonStyle.secondary],
/// which primarily decides the background and foreground colors of the buttons only.
/// Its represented by various states such as *isEnabled* which alters the state of the button
/// view and also disable it click action, similar to the *isLoading* which enables the loading view of the button.
/// ### Params
/// * [text] - represents the text to show in the button
/// * [height] - default button height
/// * [width] - default button width
/// * [isEnabled] - determines whether button should be clickable, invoke callback or not. Can also be use to modify
/// how button view reacts to click events and UI changes.
/// * [isLoading] - determines whether button should show loading state or not
/// * [buttonStyle] - can be use to determine the style applied to button as mentioned above
/// * [onPressed] - a simple callback that gets triggered when button is pressed
///

class AppButton extends StatefulWidget {
  final String text;
  final double height;
  final double width;
  final double cornerRadius;
  final bool isEnabled;
  final bool isLoading;
  final AppButtonStyle? buttonStyle;

  final VoidCallback onPressed;
  final Widget? leading;

  const AppButton({
    this.height = AppButtonStyle.buttonDefaultHeight,
    this.width = AppButtonStyle.buttonDefaultWidth,
    this.isEnabled = AppButtonStyle.buttonIsEnable,
    this.isLoading = AppButtonStyle.buttonIsLoading,
    this.cornerRadius = AppButtonStyle.buttonCornerRadius,
    this.buttonStyle,
    required this.text,
    required this.onPressed,
    this.leading,
    super.key,
  });

  @override
  State<AppButton> createState() => _AppButton();
}

class _AppButton extends State<AppButton> {
  bool isClicked = false;
  late AppButtonStyle _buttonStyle;

  @override
  void initState() {
    _buttonStyle = widget.buttonStyle ?? AppButtonStyle.primary();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AppButton oldWidget) {
    _buttonStyle = widget.buttonStyle ?? AppButtonStyle.primary();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActive() ? widget.onPressed : null,
      onTapDown: (_) {
        showClickEffect(true);
      },
      onTapUp: (_) {
        showClickEffect(false);
      },
      child: Container(
        alignment: Alignment.center,
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.0,
            color: _buttonStyle.borderColor,
          ),
          borderRadius: BorderRadius.circular(widget.cornerRadius),
          color: !widget.isEnabled
              ? _buttonStyle.disabledBackgroundColor
              : _buttonStyle.background,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (!widget.isLoading)
              FittedBox(
                  child: Row(
                children: [
                  if (widget.leading != null) widget.leading!,
                  Text(
                    widget.text,
                    style: (_buttonStyle.textStyle ?? context.textTheme.s16w500)
                        .copyWith(
                      fontSize: 18,
                      color: widget.isEnabled
                          ? _buttonStyle.textColor
                          : _buttonStyle.disabledTextColor,
                    ),
                  )
                ],
              )),
            if (widget.isLoading) ...[SizedBox(width: 20.w), const AppLoader()],
          ],
        ),
      ),
    );
  }

  void showClickEffect(bool show) {
    if (isActive()) {
      setState(() {
        isClicked = show;
      });
    }
  }

  bool isActive() => widget.isEnabled
      ? widget.isLoading
          ? false
          : true
      : false;
}
