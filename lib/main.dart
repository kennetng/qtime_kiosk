import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:qtime_kiosk/printer.dart';
import 'package:qtime_kiosk/qtimeapp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qtime',
      routes: {
        "/": (_) => MainPage(),
        "/printer": (_) => Printer(),
        "/qtimeapp": (_) => QtimeApp()
      },
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPage();
  }
}

class _MainPage extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('QTIME KIOSK'),
        backgroundColor: Color.fromRGBO(233, 28, 158, 1),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ButtonTheme(
                  minWidth: 200.0,
                  child: RaisedButton(
                    child: const Text('Printer'),
                    color: Colors.grey,
                    onPressed: () {
                      Navigator.of(context).pushNamed('/printer');
                    },
                  )),
              ButtonTheme(
                  minWidth: 200.0,
                  child: RaisedButton(
                    child: const Text('Qtime App'),
                    color: Colors.grey,
                    onPressed: () {
                      Navigator.of(context).pushNamed('/qtimeapp');
                    },
                  )),
            ]),
      ),
    );
  }
}
