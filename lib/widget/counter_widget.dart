import 'package:counter_app_flutter/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int count = 100;
  Color color = CounterTheme.colorColumbiaBlue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        brightness: Brightness.dark,
        centerTitle: true,
        elevation: 0.0,
        title: Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '$count',
              style:
                  Theme.of(context).textTheme.display4.copyWith(color: color),
            ),
            SizedBox(
              height: 50.0,
            ),
            RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 40.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              color: color,
              child: Text(
                'Add 1',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                print('cliked');
                setState(() {
                  count++;
                  color = CounterTheme.colorsList[Random().nextInt(5)];
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
