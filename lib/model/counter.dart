import 'dart:math';

import 'package:counter_app_flutter/theme.dart';
import 'package:flutter/material.dart';

class CounterBlocTheme {
  Color color = CounterTheme.primaryColor;
  int count = 0;

  CounterBlocTheme({@required this.count, @required this.color});

  void updateCounterTheme() {
    count += 1;
    color = CounterTheme.colorsList[Random().nextInt(5)];
  }
}
