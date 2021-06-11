import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stopwatch_flutter/controller/stopwatch_controller.dart';
import 'package:stopwatch_flutter/ui/mainScreen/widgets/reset_button.dart';
import 'package:stopwatch_flutter/ui/mainScreen/widgets/start_stop_button.dart';

import 'mainScreen/widgets/stopwatch_renderer.dart';

class Stopwatch extends StatefulWidget {
  @override
  _StopwatchState createState() => _StopwatchState();
}

Duration _previouslyElapsedTime = Duration.zero;
Duration _currentlyElapsedTime = Duration.zero;
bool _isRunning = false;
late final Ticker? _ticker;
Duration get _elapsed => _previouslyElapsedTime + _currentlyElapsedTime;

class _StopwatchState extends State<Stopwatch>
    with SingleTickerProviderStateMixin {
  late StopWatchController _controller;
  @override
  void initState() {
    super.initState();
    _ticker = this.createTicker((elapsed) {
      setState(() {
        _currentlyElapsedTime = elapsed;
      });
    });
    _controller = StopWatchController();
  }

  @override
  void dispose() {
    super.dispose();
    _ticker?.stop();
  }

  void _reset() {
    setState(() {
      _isRunning = false;
      _currentlyElapsedTime = Duration.zero;
      _previouslyElapsedTime = Duration.zero;
      _ticker?.stop();
    });
  }

  void _toggleButton() {
    setState(() {
      _isRunning = !_isRunning;
      if (_isRunning) {
        _ticker?.start();
      } else
        _ticker?.stop();
      _previouslyElapsedTime += _currentlyElapsedTime;
      _currentlyElapsedTime = Duration.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // width = constraints.maxWidth
        // height = constraints.maxHeight
        final radius = constraints.maxWidth / 2;
        return Stack(
          children: [
            StopWatchRenderer(
              elapsed: _elapsed,
              radius: radius,
            ),
            Align(
                alignment: Alignment.bottomLeft,
                child: SizedBox(
                    height: 80,
                    width: 80,
                    child: ResetButton(onPressed: _reset))),
            Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                    height: 80,
                    width: 80,
                    child: StartStopButton(
                        isRunning: _isRunning, onPressed: _toggleButton)))
          ],
        );
      },
    );
  }
}
