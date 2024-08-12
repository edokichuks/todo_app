// Flutter imports:
import 'package:flutter/material.dart';

class SlideFromBottomWidget extends StatefulWidget {
  const SlideFromBottomWidget({
    super.key,
    required this.child,
    required this.onTap,
    this.delay = 0.0,
  });
  final Widget child;
  final ValueChanged<AnimationController> onTap;
  final double delay;

  @override
  State<SlideFromBottomWidget> createState() => _SlideFromBottomWidgetState();
}

class _SlideFromBottomWidgetState extends State<SlideFromBottomWidget>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _forward();
  }

  void _forward() async {
    if (widget.delay != 0.0) {
      Future.delayed(Duration(milliseconds: (200 * widget.delay).toInt()), () {
        _controller.forward();
      });
    } else {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () => widget.onTap.call(_controller),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 2),
          end: const Offset(0, 0.2),
        ).animate(_controller),
        child: ScaleTransition(
          scale: _animation,
          child: widget.child,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
