import 'dart:async';
import 'package:counter_app_flutter/model/counter_bloc_theme.dart';
import 'package:flutter/material.dart';

class CounterBloc {
  final blocController = StreamController<CounterBlocTheme>();

  Sink<CounterBlocTheme> get change => blocController.sink;

  final countController = StreamController<int>();

  Stream<int> get count => countController.stream;

  final colorController = StreamController<Color>();

  Stream<Color> get color => colorController.stream;

  CounterBloc() {
    blocController.stream.listen(onAdd);
  }

  void onAdd(CounterBlocTheme bloc) {
    bloc.updateCounterTheme();
    countController.add(bloc.count);
    colorController.add(bloc.color);
  }
}
