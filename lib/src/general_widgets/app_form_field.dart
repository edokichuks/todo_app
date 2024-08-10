// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:todo_app/src/core/extensions/theme_extensions.dart';
import 'package:todo_app/src/core/utils/colors.dart';

class AppFormField extends StatefulWidget {
  const AppFormField({
    super.key,
    this.textStyle,
    this.width,
    this.labelSpace = 8,
    this.textCapitalization = TextCapitalization.sentences,
    this.padding = const SizedBox(
      height: 22,
    ),
    this.onTap,
    this.decoration,
    this.hintStyle,
    this.backgroundColor,
    this.isLoading = false,
    this.readOnly = false,
    this.customLabel,
    this.hintText,
    this.controller,
    this.minLines = 1,
    this.obscureText = false,
    this.enabled = true,
    this.validateFunction,
    this.borderSide,
    this.onSaved,
    this.onChange,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.nextFocusNode,
    this.submitAction,
    this.enableErrorMessage = true,
    this.maxLines = 1,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.prefixIcon,
    this.bordercolor,
    this.autofocus,
    this.label,
    this.inputFormatters,
    this.borderRadius = 8,
    this.initialValue,
    this.labelSize,
    this.labelColor,
  });
  final double? width;
  final double? labelSize;
  final String? hintText;
  final TextEditingController? controller;
  final int? minLines;
  final int? maxLines;
  final bool? obscureText;
  final bool? enabled;
  final FormFieldValidator<String>? validateFunction;
  final void Function(String)? onSaved;
  final void Function(String)? onChange;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final VoidCallback? submitAction;
  final bool? enableErrorMessage;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onTap;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? bordercolor;
  final Color? backgroundColor;
  final Color? labelColor;
  final bool? autofocus;
  final String? label;
  final InputDecoration? decoration;
  final List<TextInputFormatter>? inputFormatters;
  final bool isLoading;
  final bool readOnly;
  final double borderRadius;
  final double labelSpace;
  final String? initialValue;
  final Widget? customLabel;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final BorderSide? borderSide;
  final Widget padding;
  final TextCapitalization textCapitalization;

  @override
  State<AppFormField> createState() => _AppFormFieldState();
}

class _AppFormFieldState extends State<AppFormField> {
  String? error;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.customLabel != null) widget.customLabel!,
        if (widget.customLabel == null && widget.label != null)
          Text(
            widget.label!,
            style:
                context.textTheme.s16w400.copyWith(color: AppColors.textGrey),
          ),
        if (widget.customLabel != null || widget.label != null)
          SizedBox(height: widget.labelSpace),
        TextFormField(
          textCapitalization: widget.textCapitalization,
          onTap: widget.onTap,
          readOnly: widget.readOnly,
          initialValue: widget.initialValue,
          textAlign: TextAlign.left,
          inputFormatters: widget.inputFormatters,
          autofocus: widget.autofocus ?? false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          enabled: widget.enabled,
          validator: widget.validateFunction != null
              ? widget.validateFunction!
              : (value) {
                  return null;
                },
          onSaved: (val) {
            error = widget.validateFunction!(val);
            setState(() {});
            widget.onSaved!(val!);
          },
          onChanged: (val) {
            widget.validateFunction != null
                ? error = widget.validateFunction!(val)
                : error = null;
            setState(() {});
            if (widget.onChange != null) widget.onChange!.call(val);
          },
          style: widget.textStyle ??
              const TextStyle(
                fontSize: 14,
              ),
          cursorColor: AppColors.frodorOrange,
          key: widget.key,
          maxLines: widget.maxLines,
          controller: widget.controller,
          obscureText: widget.obscureText!,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          focusNode: widget.focusNode,
          onFieldSubmitted: widget.onFieldSubmitted,
          decoration: widget.decoration ??
              InputDecoration(
                filled: true,
                fillColor: widget.backgroundColor ?? AppColors.greyLightest,
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.suffixIcon,
                enabled: false,
                errorStyle: const TextStyle(fontSize: 0, height: -30),
                hintText: widget.hintText,
                hintStyle: widget.hintStyle ??
                    context.textTheme.s16w400.copyWith(
                      color: AppColors.lightGrey,
                    ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: widget.borderSide ??
                      BorderSide(
                        color: AppColors.errorColor.withOpacity(0.3),
                      ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: widget.borderSide ??
                      BorderSide(
                        color: AppColors.errorColor.withOpacity(0.3),
                      ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: widget.borderSide ??
                      BorderSide(
                        color: widget.bordercolor ?? AppColors.borderGrey,
                      ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: widget.borderSide ??
                      BorderSide(
                        color: widget.bordercolor ?? AppColors.borderGrey,
                      ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: widget.borderSide ??
                      BorderSide(
                        color: widget.bordercolor ?? AppColors.borderGrey,
                      ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: widget.borderSide ??
                      const BorderSide(
                        color: AppColors.primary,
                        width: 1,
                      ),
                ),
              ),
        ),
        if (error != null)
          SizedBox(
            height: 5.h,
          ),
        if (error != null)
          Text(
            error!,
            style: const TextStyle(
              color: AppColors.errorColor,
              fontSize: 12,
            ),
          ),
        widget.padding,
      ],
    );
  }
}
