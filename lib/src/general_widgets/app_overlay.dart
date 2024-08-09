// ignore_for_file: library_private_types_in_public_api

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:todo_app/src/core/extensions/theme_extensions.dart';
import 'package:todo_app/src/core/utils/colors.dart';
import 'package:todo_app/src/core/utils/enums.dart';
import 'package:todo_app/src/general_widgets/app_loader.dart';

class AppOverLay extends StatefulWidget {
  const AppOverLay({
    super.key,
    required this.child,
    required this.controller,
    this.messagePadding,
  });
  final Widget child;
  final OverLayLoaderController controller;
  final EdgeInsetsGeometry? messagePadding;

  @override
  State<AppOverLay> createState() => _AppOverLayState();

  static _AppOverLayState of(BuildContext context) {
    final _AppOverLayState? result =
        context.findAncestorStateOfType<_AppOverLayState>();
    if (result != null) return result;
    throw FlutterError.fromParts(<DiagnosticsNode>[
      ErrorSummary(
        'AppOverLay.of() called with a context that does not contain a AppOverLay.',
      ),
      ErrorDescription(
        'No AppOverLay ancestor could be found starting from the context that was passed to AppOverLay.of(). '
        'This usually happens when the context provided is from the same StatefulWidget as that '
        'whose build function actually creates the AppOverLay widget being sought.',
      ),
      context.describeElement('The context used was'),
    ]);
  }
}

class _AppOverLayState extends State<AppOverLay> {
  OverLayLoaderController get controller => widget.controller;

  void showMessage({
    required String message,
    String? title,
    required MessageType messageType,
  }) {
    return controller.showMessage(
      message: message,
      messageType: messageType,
      title: title,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      textDirection: TextDirection.ltr,
      children: [
        widget.child,
        ValueListenableBuilder<(OverLayType, _MessageText?)>(
          valueListenable: widget.controller._valueNotifier,
          builder: (context, listen, child) {
            if (listen.$1 == OverLayType.loader) {
              return Positioned.fill(
                child: Material(
                  color: Colors.black.withOpacity(.5),
                  child: const AppLoader(size: 30),
                ),
              );
            } else if (listen.$1 == OverLayType.message) {
              return SafeArea(
                child: Container(
                  padding: widget.messagePadding ?? const EdgeInsets.all(20),
                  alignment: Alignment.topCenter,
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(begin: -20, end: 0),
                    curve: Curves.easeInOut,
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(0, value),
                        child: _messageWidget(
                          messageIcon:
                              listen.$2?.messageType == MessageType.error
                                  ? 'assets/svgs/error.svg'
                                  : 'assets/svgs/success.svg',
                          messageText: listen.$2!,
                          messageColor:
                              listen.$2?.messageType == MessageType.error
                                  ? AppColors.errorColor
                                  : AppColors.green,
                          onClose: () {
                            controller.removeOverLay();
                          },
                        ),
                      );
                    },
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }

  Widget _messageWidget({
    required _MessageText messageText,
    required String messageIcon,
    required Color messageColor,
    required VoidCallback onClose,
  }) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: messageColor),
      ),
      color: messageText.messageType == MessageType.error
          ? const Color(0XFFFFF2F2)
          : const Color(0XFFDCF3EB),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 15.h),
        width: double.infinity,
        constraints: BoxConstraints(
          minHeight: 63.0,
          maxWidth: MediaQuery.of(context).size.width,
          minWidth: MediaQuery.of(context).size.width,
        ),
        child: Row(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(messageIcon, height: 30.h),
            SizedBox(
              width: 15.w,
            ),
            Expanded(
              child: Column(
                textDirection: TextDirection.ltr,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (messageText.title != null)
                    Text(
                      messageText.title!,
                      style: context.textTheme.s13w700.copyWith(
                        color: messageColor,
                      ),
                      textDirection: TextDirection.ltr,
                    ),
                  Text(
                    messageText.message,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.s13w400.copyWith(
                      color: messageColor,
                    ),
                    textDirection: TextDirection.ltr,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OverLayLoaderController {
  final ValueNotifier<(OverLayType, _MessageText?)> _valueNotifier =
      ValueNotifier((OverLayType.none, null));

  void showLoader() {
    _valueNotifier.value = ((OverLayType.loader, null));
  }

  void showMessage({
    required String message,
    String? title,
    required MessageType messageType,
  }) {
    _valueNotifier.value = ((
      OverLayType.message,
      _MessageText(
        title: title,
        message: message,
        messageType: messageType,
      )
    ));
    Future.delayed(const Duration(seconds: 3), () {
      removeOverLay();
    });
  }

  void removeOverLay() {
    _valueNotifier.value = ((OverLayType.none, null));
  }

  void dispose() {
    _valueNotifier.dispose();
  }
}

class _MessageText {
  final String? title;
  final String message;
  final MessageType messageType;
  _MessageText({
    this.title,
    required this.message,
    required this.messageType,
  });
}
