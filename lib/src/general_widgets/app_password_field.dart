// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:todo_app/src/core/extensions/theme_extensions.dart';
import 'package:todo_app/src/core/utils/colors.dart';

class AppPasswordField extends StatefulWidget {
  const AppPasswordField({
    super.key,
    this.width,
    this.labelSpace = 8,
    this.padding = const SizedBox(
      height: 16,
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
    this.enabled = true,
    this.validateFunction,
    this.borderSide,
    this.onSaved,
    this.onChange,
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
    this.obscureIconColor,
  });
  final double? width;
  final double? labelSize;
  final String? hintText;
  final TextEditingController? controller;
  final int? minLines;
  final int? maxLines;
  final bool? enabled;
  final FormFieldValidator<String>? validateFunction;
  final void Function(String)? onSaved;
  final void Function(String)? onChange;
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
  final BorderSide? borderSide;
  final Widget padding;
  final Color? obscureIconColor;

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  String? error;
  bool obscure = true;
  late BorderSide _borderSide;

  @override
  void initState() {
    super.initState();
    _borderSide = widget.borderSide ??
        const BorderSide(
          color: AppColors.borderGrey,
        );
  }

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
          textCapitalization: TextCapitalization.sentences,
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
            widget.onChange?.call(val);
          },
          style: const TextStyle(
            fontSize: 14,
          ),
          cursorColor: AppColors.frodorOrange,
          key: widget.key,
          maxLines: widget.maxLines,
          controller: widget.controller,
          obscureText: obscure,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: widget.textInputAction,
          focusNode: widget.focusNode,
          onFieldSubmitted: widget.onFieldSubmitted,
          decoration: widget.decoration ??
              InputDecoration(
                prefixIcon: widget.prefixIcon,
                suffixIcon: GestureDetector(
                  onTap: () => setState(
                    () {
                      obscure = !obscure;
                    },
                  ),
                  child: Icon(
                    !obscure ? Icons.visibility : Icons.visibility_off_outlined,
                  ),
                ),
                filled: true,
                enabled: false,
                errorStyle: const TextStyle(fontSize: 0, height: -30),
                fillColor: widget.backgroundColor ?? AppColors.greyLightest,
                hintText: widget.hintText,
                hintStyle: widget.hintStyle ??
                    context.textTheme.s16w400.copyWith(
                      color: AppColors.lightGrey,
                    ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: BorderSide(
                    color: AppColors.errorColor.withOpacity(0.3),
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: BorderSide(
                    color: AppColors.errorColor.withOpacity(0.3),
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: _borderSide,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: _borderSide,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: _borderSide,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: const BorderSide(
                    color: AppColors.brandBrown,
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
              color: Colors.red,
              fontSize: 12,
            ),
          ),
        widget.padding,
      ],
    );
  }
}
