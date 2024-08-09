// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:pin_code_fields/pin_code_fields.dart';

// Project imports:
import 'package:todo_app/src/core/utils/colors.dart';

class CustomPinCodeTextField extends StatefulWidget {
  const CustomPinCodeTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.padding,
    this.isReadOnly = false,
    this.length = 4,
    this.onCompleted,
    this.color = const Color(0xffFAFBFC),
    this.separator = const SizedBox(width: 10),
    this.errorMessage,
    this.boxWidth = 70,
    this.boxHeight = 70,
    this.borderWidth = 1,
    this.validateFunction,
  });
  final double? padding;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onCompleted;
  final bool isReadOnly;
  final Color? color;
  final int length;
  final Widget? separator;
  final String? errorMessage;
  final double boxWidth;
  final double boxHeight;
  final double borderWidth;
  final FormFieldValidator<String>? validateFunction;

  @override
  State<CustomPinCodeTextField> createState() => _CustomPinCodeTextFieldState();
}

class _CustomPinCodeTextFieldState extends State<CustomPinCodeTextField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      autoDisposeControllers: false,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      appContext: context,
      length: widget.length,
      controller: widget.controller,
      obscureText: true,
      obscuringCharacter: "-",
      focusNode: _focusNode,
      showCursor: false,
      enableActiveFill: true,
      textStyle: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(color: AppColors.starColor, fontSize: 16),
      blinkWhenObscuring: true,
      keyboardType: TextInputType.number,
      readOnly: widget.isReadOnly,
      onChanged: (pin) {
        if (pin.length == widget.length) {
          widget.onCompleted?.call(pin);
        }
        widget.onChanged?.call(pin);
      },
      separatorBuilder: (context, index) {
        return widget.separator ?? const SizedBox();
      },
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8),
        fieldHeight: widget.boxHeight,
        borderWidth: widget.borderWidth,
        selectedFillColor: widget.color,
        fieldWidth: widget.boxWidth,
        inactiveFillColor: widget.color,
        activeFillColor: widget.color,
        activeColor: AppColors.frodorOrange,
        inactiveColor: const Color(0xffD4DAE0),
        selectedColor: const Color(0xffD4DAE0),
      ),
      validator: widget.validateFunction,
    );
  }
}
