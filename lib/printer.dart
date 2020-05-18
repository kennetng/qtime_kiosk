import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

const PRINTER = 'http://qtimeapp.com';

class Printer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Printer();
  }
}

class _Printer extends State<Printer> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: OfflineBuilder(
          connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
          ) {
            final bool connected = connectivity != ConnectivityResult.none;
            return new Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  height: 24.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    color: connected ? Color(0xFF00EE44) : Color(0xFFEE4400),
                    child: Center(
                      child: Text("${connected ? 'ONLINE' : 'OFFLINE'}"),
                    ),
                  ),
                ),
                connected
                    ? WebviewScaffold(
                        url: PRINTER,
                        withJavascript: true,
                        withLocalStorage: true,
                      )
                    : Container()
              ],
            );
          },
          child: Container()),
    );
  }
}
