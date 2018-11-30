import 'package:counter_app_flutter/theme.dart';
import 'package:counter_app_flutter/widget/counter_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(CounterApp());

class CounterApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Counter Application",
      theme: ThemeData(
        primaryColor: CounterTheme.primaryColor,
      ),
      home: CounterWidget(),
    );
  }

}