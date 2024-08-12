// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:todo_app/src/core/utils/utils_exports.dart';
import 'package:todo_app/src/features/home/views/home_screen.dart';
import 'package:todo_app/src/features/photos/view/photos_screen.dart';
import 'package:todo_app/src/features/photos/widgets/animiated_gridview.dart';
import 'package:todo_app/src/features/task/views/create_task_screen.dart';
import 'package:todo_app/src/features/todo_screen.dart';
import 'package:todo_app/src/general_widgets/bottom_nav_bar/animated_nav_bar.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});
  static const routeName = "custom_nav_bar";

  @override
  ConsumerState<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  int selectedTab = 0;
  void _selectedTab(int index) => setState(() => selectedTab = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.white,
      body: SafeArea(
        child: IndexedStack(
          index: selectedTab,
          children: const [
            HomeScreen(),
            TodoScreen(),
            TodoScreen(),
            TodoScreen(),
          ],
        ),
      ),
      floatingActionButton: selectedTab == 0
          ? FloatingActionButton(
              shape: const CircleBorder(),
              onPressed: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const CreateTaskScreen())),
              backgroundColor: AppColors.primary,
              child: const Icon(
                CupertinoIcons.plus,
                color: Colors.white,
                size: 40,
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavBar(
        onChanged: _selectedTab,
      ),
    );
  }
}
