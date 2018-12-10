import 'package:counter_app_flutter/bloc/counter_bloc.dart';
import 'package:counter_app_flutter/bloc/counter_bloc_provider.dart';
import 'package:counter_app_flutter/model/counter_bloc_theme.dart';
import 'package:counter_app_flutter/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  // setting Initial Count Value and Color
  int count = 0;
  Color color = CounterTheme.primaryColor;

  @override
  Widget build(BuildContext context) {
    var myCounter =
        CounterBlocTheme(count: 0, color: CounterTheme.primaryColor);
    CounterBloc bloc = CounterBloc();
    return CounterBlocProvider(
      bloc: bloc,
      child: StreamBuilder<Color>(
        stream: bloc.color,
        builder: (context,snapshotColor)=>Scaffold(
          appBar: AppBar(
            backgroundColor: snapshotColor.data,
            brightness: Brightness.dark,
            centerTitle: true,
            elevation: 0.0,
            title: Text('Counter'),
          ),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                StreamBuilder<int>(
                  stream: bloc.count,
                  builder: (context,snapshot) => Text(
                    '${snapshot.data}',
                    style:
                    Theme.of(context).textTheme.display4.copyWith(color: snapshotColor.data),
                  ),
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
                  color: snapshotColor.data,
                  child: Text(
                    'Click to Add',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    bloc.onAdd(myCounter);
                    // setState(() {
                    //   count++;
                    //   color = CounterTheme.colorsList[Random().nextInt(5)];
                    // });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
