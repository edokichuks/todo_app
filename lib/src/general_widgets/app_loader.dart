// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:todo_app/src/core/utils/colors.dart';

class AppLoader extends StatefulWidget {
  const AppLoader({super.key, this.size = 20.0});
  final double size;

  @override
  State<AppLoader> createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..repeat();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, c) {
        return Center(
          child: Transform.rotate(
            angle: _animation.value * 6.3,
            alignment: Alignment.center,
            child: SizedBox(
              height: widget.size,
              width: widget.size,
              child: SvgPicture.asset(
                'assets/svgs/app_logo.svg',
                // colorFilter: const ColorFilter.mode(
                //   AppColors.primary,
                //   BlendMode.srcIn,
                // ),
              ),
            ),
          ),
        );
      },
    );
  }
}
