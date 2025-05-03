import 'dart:async';

import 'package:flutter/material.dart';

class CustomTimerWidget extends StatefulWidget {
  final bool autoStart;
  final Widget Function(CustomTimer tiker) builder;
  final CustomTimerController controller;
  final Function? onFinish;
  const CustomTimerWidget(
      {super.key,
      required this.builder,
      this.autoStart = false,
      required this.controller,
      this.onFinish});
  @override
  State<CustomTimerWidget> createState() => _CustomTimerWidgetState();
}

class _CustomTimerWidgetState extends State<CustomTimerWidget> {
  @override
  void initState() {
    if (widget.autoStart) widget.controller.start();

    widget.controller._onFinish = () {
      if (widget.onFinish != null) widget.onFinish!();
    };

    super.initState();
  }

  @override
  void dispose() {
    widget.controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CustomTimer>(
      stream: widget.controller._controller.stream,
      initialData: widget.controller._getInitData(),
      builder: (context, snapshot) {
        return widget
            .builder(snapshot.data ?? widget.controller._getInitData());
      },
    );
  }
}

class CustomTimer {
  int days, hours, minutes, seconds;
  CustomTimer(
      {this.days = 0, this.hours = 0, this.minutes = 0, this.seconds = 0});
  @override
  toString() {
    return "days : $days - hours : $hours - minutes : $minutes - seconds : $seconds";
  }
}

class CustomTimerController {
  Duration duration;
  CustomTimerController(this.duration) {
    _onFinish = () {};
  }
  final StreamController<CustomTimer> _controller =
      StreamController.broadcast();
  Timer? timer;
  late int _sec;
  _startCounterDown() {
    _sec = duration.inSeconds;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_sec == 0) {
        _controller.add(_getCustomTimer(_sec));
        _onFinish();
        timer.cancel();
      } else {
        _controller.add(_getCustomTimer(_sec));
        _sec -= 1;
      }
    });
  }

  start() {
    if (timer?.isActive != true) _startCounterDown();
  }

  stop() {
    if (timer?.isActive == true) {
      timer?.cancel();
    }
  }

  setDuration(Duration duration) {
    this.duration = duration;
    _sec = duration.inSeconds;
    timer?.cancel();
    start();
  }

  close() {
    _controller.close();
    timer?.cancel();
  }

  CustomTimer _getInitData() {
    int sec = duration.inSeconds;
    return _getCustomTimer(sec);
  }

  late Function _onFinish;

  CustomTimer _getCustomTimer(int sec) {
    int secDuration = sec;
    final modifierTimer = CustomTimer();
    modifierTimer.days = secDuration ~/ (24 * 60 * 60);
    secDuration -= modifierTimer.days * (24 * 60 * 60);
    modifierTimer.hours = secDuration ~/ (60 * 60);
    secDuration -= modifierTimer.hours * (60 * 60);
    modifierTimer.minutes = secDuration ~/ 60;
    secDuration -= modifierTimer.minutes * 60;
    modifierTimer.seconds = secDuration;
    return modifierTimer;
  }
}
