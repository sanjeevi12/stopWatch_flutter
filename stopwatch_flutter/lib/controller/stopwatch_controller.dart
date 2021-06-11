import 'package:flutter/material.dart';

class StopWatchController with ChangeNotifier{
  bool _isRunning = false;

  bool get isRunning => _isRunning;

  void setIsRunning(value){
      _isRunning = value;
  }

}