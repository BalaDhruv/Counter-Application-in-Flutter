import 'dart:async';
import 'package:counter_app_flutter/model/counter_bloc_theme.dart';

class CounterBloc {
  final CounterBlocTheme theme;
  CounterBloc(this.theme);

  final object = StreamController<CounterBlocTheme>();

  Stream<CounterBlocTheme> get themeObject => object.stream;

  void onAdd(CounterBlocTheme theme) {
    object.add(theme);
  }

  void close(){
    object.close();
  }

}
