// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:todo_app/src/core/utils/utils_exports.dart';

class ChipTabs extends StatefulWidget {
  const ChipTabs({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChipTabsState createState() => _ChipTabsState();
}

class _ChipTabsState extends State<ChipTabs> {
  int _selectedIndex = 0;

  final List<String> _tabs = ["Design", "Development", "Research"];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List<Widget>.generate(_tabs.length, (int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: ChoiceChip(
            label: Container(
              height: 24.h,
              alignment: Alignment.center,
              child: Text(
                _tabs[index],
                style: TextStyle(
                  color: _selectedIndex != index
                      ? AppColors.textColor
                      : Colors.white,
                ),
              ),
            ),
            checkmarkColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Rounded corners
              side: const BorderSide(
                  color: Colors.transparent), // Remove the border
            ),
            selectedColor: AppColors.primary,
            backgroundColor: const Color.fromARGB(255, 164, 211, 254),
            selected: _selectedIndex == index,
            onSelected: (bool selected) {
              setState(() {
                // _selectedIndex = selected ? index : 0;
                _selectedIndex = index;
              });
            },
          ),
        );
      }),
    );
  }
}
