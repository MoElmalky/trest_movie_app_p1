import 'package:flutter/material.dart';

class AutoScroller extends StatefulWidget {
  final Widget child;
  final Axis scrollDirection;
  final Duration forwardDuration;
  final Duration backDuration;
  final Duration forwardCoolDown;
  final Duration backCoolDown;
  final bool reverse;
  final Curve forwardCurve;
  final Curve backCurve;
  const AutoScroller({
    super.key,
    required this.child,
    this.scrollDirection = Axis.horizontal,
    this.forwardDuration = const Duration(seconds: 2),
    this.backDuration = const Duration(seconds: 2),
    this.forwardCoolDown = const Duration(seconds: 1),
    this.backCoolDown = const Duration(seconds: 1),
    this.forwardCurve = Curves.linear,
    this.backCurve = Curves.linear,
    this.reverse = false,
  });

  @override
  State<AutoScroller> createState() => _AutoScrollerState();
}

class _AutoScrollerState extends State<AutoScroller>
    with SingleTickerProviderStateMixin {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
        _startAutoScroll();
    });
  }

  void _startAutoScroll() async {
    while (true) {
      if (_scrollController.hasClients) {
        await _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: widget.forwardDuration,
          curve: widget.forwardCurve,
        );
      } else {
        return;
      }
      await Future.delayed(widget.backCoolDown);

      if (_scrollController.hasClients) {
        if (widget.reverse) {
          await _scrollController.animateTo(
            0,
            duration: widget.backDuration,
            curve: widget.backCurve,
          );
        } else {
          _scrollController.jumpTo(0);
        }
      } else {
        return;
      }
      await Future.delayed(widget.forwardCoolDown);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: widget.scrollDirection,
      controller: _scrollController,
      child: widget.child,
    );
  }
}
