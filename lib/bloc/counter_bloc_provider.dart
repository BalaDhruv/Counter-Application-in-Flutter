import 'package:counter_app_flutter/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';

class CounterBlocProvider extends InheritedWidget {
  final CounterBloc bloc;
  final Widget child;

  CounterBlocProvider({this.bloc, this.child}) : super(child: child);

  static CounterBlocProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CounterBlocProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
