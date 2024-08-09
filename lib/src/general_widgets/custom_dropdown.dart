// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:todo_app/src/core/extensions/string_extensions.dart';
import 'package:todo_app/src/core/extensions/theme_extensions.dart';
import 'package:todo_app/src/core/utils/colors.dart';
import 'package:todo_app/src/general_widgets/app_loader.dart';

class AppDropDown<T> extends StatefulWidget {
  const AppDropDown({
    super.key,
    this.hintText = "Select",
    required this.menuList,
    required this.onChanged,
    this.labelSize,
    this.isLoading = false,
    this.label,
    this.halfLabel,
    required this.hasError,
    this.childPadding = EdgeInsets.zero,
    this.borderColor = Colors.transparent,
    this.icon,
    this.initialDisplayValue,
  });
  final String hintText;
  final List<(String, T)> menuList;
  final void Function(T) onChanged;
  final String? label;
  final String? halfLabel;
  final double? labelSize;
  final bool hasError;
  final EdgeInsetsGeometry childPadding;
  final Color borderColor;
  final Widget? icon;
  final bool isLoading;
  final String? initialDisplayValue;

  @override
  State<AppDropDown<T>> createState() => _AppDropDownState<T>();
}

class _AppDropDownState<T> extends State<AppDropDown<T>> {
  String? value;

  @override
  void initState() {
    super.initState();
    value = widget.initialDisplayValue;
  }

  @override
  void didUpdateWidget(covariant AppDropDown<T> oldWidget) {
    if (oldWidget.initialDisplayValue != widget.initialDisplayValue &&
        widget.initialDisplayValue != null) {
      setState(() {
        value = widget.initialDisplayValue;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style:
                context.textTheme.s16w400.copyWith(color: AppColors.textGrey),
          ),
          SizedBox(height: 8.h),
        ],
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    width: 1,
                    color: widget.hasError
                        ? AppColors.errorColor
                        : AppColors.borderGrey,
                  ),
                  color: AppColors.greyLightest),
              child: widget.isLoading
                  ? SizedBox(
                      height: 50.h,
                      child: const AppLoader(),
                    )
                  : PopupMenuButton<String>(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(
                          color: AppColors.borderGrey,
                        ),
                      ),
                      elevation: 0,
                      color: AppColors.greyLightest,
                      offset: const Offset(0, 5),
                      position: PopupMenuPosition.under,
                      constraints: BoxConstraints.tightFor(
                        width: MediaQuery.sizeOf(context).width * 0.88,
                        height: widget.menuList.length > 3 ? 220.h : null,
                      ),
                      itemBuilder: (context) {
                        return List.generate(
                          widget.menuList.length,
                          (index) => PopupMenuItem<String>(
                            enabled: true,
                            padding: EdgeInsets.zero,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10,
                                    ),
                                    child: Text(
                                      widget.menuList[index].$1.capiTalizeFirst,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: context.textTheme.s14w400
                                          .copyWith(color: AppColors.dark),
                                    ),
                                  ),
                                ),
                                if (index != widget.menuList.length - 1)
                                  const Divider(
                                    color: AppColors.borderGrey,
                                  ),
                              ],
                            ),
                            onTap: () => setState(() {
                              value = widget.menuList[index].$1;
                              widget.onChanged(widget.menuList[index].$2);
                            }),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                switch (value == null) {
                                  true => widget.hintText,
                                  _ => value!.capiTalizeFirst,
                                },
                                style: switch (value == null) {
                                  true => context.textTheme.s16w400.copyWith(
                                      color: AppColors.lightGrey,
                                    ),
                                  _ => const TextStyle(fontSize: 14),
                                },
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                softWrap: true,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            const Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: AppColors.dark,
                            )
                          ],
                        ),
                      ),
                    ),
            ),
            if (widget.halfLabel != null)
              Positioned(
                top: -20,
                left: 10,
                child: Container(
                  color: AppColors.white,
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    widget.halfLabel!,
                    style: context.textTheme.s14w400
                        .copyWith(color: AppColors.dark),
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: 22.h),
      ],
    );
  }
}
