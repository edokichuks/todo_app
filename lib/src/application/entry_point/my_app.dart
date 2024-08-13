// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:todo_app/src/core/router/router.dart';
import 'package:todo_app/src/core/utils/styles/theme_helper.dart';
import 'package:todo_app/src/features/start_up/views/onboarding_screen.dart.dart';
import 'package:todo_app/src/general_widgets/general_widget_exports.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _controller = OverLayLoaderController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: AppOverLay(
        controller: _controller,
        child: MaterialApp(
          title: 'Todo App',
          routes: AppRouter.routes,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              visualDensity: VisualDensity.adaptivePlatformDensity,
              fontFamily: 'Mark Pro',
              scaffoldBackgroundColor: Colors.white,
              textTheme: Theme.of(context).textTheme.apply(
                    fontFamily: 'Mark Pro',
                  ),
              colorScheme: theme.colorScheme),
          builder: (context, widget) {
            return ScreenUtilInit(
              useInheritedMediaQuery: true,
              minTextAdapt: true,
              ensureScreenSize: true,
              rebuildFactor: (old, data) => true,
              designSize: const Size(375, 812),
              builder: (context, child) {
                return widget!;
              },
            );
          },
          home: const OnboardingScreen(),
        ),
      ),
    );
  }
}
