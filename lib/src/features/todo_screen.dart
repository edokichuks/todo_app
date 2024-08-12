// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/src/features/photos/view/photos_screen.dart';
import 'package:todo_app/src/general_widgets/general_widget_exports.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AppButton(
                width: 250.w,
                text: 'Get API Data',
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const PhotosScreen(),
                      ));
                }),
          ),
          // StartPage(),
        ],
      ),
    );
  }
}
