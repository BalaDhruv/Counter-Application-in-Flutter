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

  CounterBloc bloc;
  var myCounter ;

  @override
  void initState() {
    super.initState();
    myCounter = CounterBlocTheme(count: 0, color: CounterTheme.primaryColor);
    bloc = CounterBloc(myCounter);
  }

  @override
  void dispose() {
    print('releasing memory..');
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CounterBlocProvider(
      bloc: bloc,
      child: StreamBuilder<CounterBlocTheme>(
        stream: bloc.themeObject,
        initialData: myCounter,
        builder: (context,themeSnapshot){
          if(themeSnapshot.hasData){
            print(themeSnapshot.data.color.toString());
          }else{
            print("No data available");
          }
          return themeSnapshot.hasData ? Scaffold(
            appBar: AppBar(
              backgroundColor: themeSnapshot.data.color,
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
                    '${themeSnapshot.data.count}',
                    style:
                    Theme.of(context).textTheme.display4.copyWith(color: themeSnapshot.data.color),
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
                    color: themeSnapshot.data.color,
                    child: Text(
                      'Click to Add',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      myCounter.updateCounterTheme();
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
          ): Container(color: Colors.red,);
        }
      ),
    );
  }
}
