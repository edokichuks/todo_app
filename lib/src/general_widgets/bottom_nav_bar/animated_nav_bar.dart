// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import 'package:todo_app/src/core/utils/app_dimensions.dart';
import 'package:todo_app/src/core/utils/utils_exports.dart';
import 'slide_from_bottom.dart';

// Package imports:

class AnimatedBottomNavBar extends StatefulWidget {
  const AnimatedBottomNavBar({
    super.key,
    required this.onChanged,
  });
  final void Function(int) onChanged;

  @override
  State<AnimatedBottomNavBar> createState() => AnimatedBottomNavBarState();
}

class AnimatedBottomNavBarState extends State<AnimatedBottomNavBar>
    with TickerProviderStateMixin {
  final List<IconData> items = [
    Icons.home,
    Icons.calendar_month,
    Icons.chat,
    Icons.person,
  ];

  int _currentIndex = 0;
  // @override
  // void didUpdateWidget(covariant AnimatedBottomNavBar oldWidget) {
  //   if (widget.onChanged != oldWidget.onChanged) {
  //     widget.onChanged(_currentIndex);
  //   }
  //   super.didUpdateWidget(oldWidget);
  // }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 72,
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      elevation: 10,
      color: AppColors.profileGrey,
      padding: const EdgeInsets.only(top: 8, bottom: 15),
      child: SafeArea(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            4,
            (index) => Expanded(
              child: SlideFromBottomWidget(
                delay: index.toDouble(),
                onTap: (controller) {
                  if (_currentIndex == index) {
                    return;
                  }
                  controller
                    ..reset()
                    ..forward();
                  widget.onChanged(index);
                  setState(() {
                    _currentIndex = index;
                  });
                  HapticFeedback.selectionClick();
                },
                key: ValueKey(items[index]),
                child: Icon(
                  items[index],
                  size: AppDimensions.large,
                  color: switch (index != _currentIndex) {
                    true => const Color(0xFFCBD2D9),
                    _ => AppColors.primary,
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
