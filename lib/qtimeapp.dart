import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

var QTIMEAPP = 'https://pilot.qtimecloud.com/main-page';

class QtimeApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QtimeApp();
  }
}

class _QtimeApp extends State<QtimeApp> {
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
                        url: QTIMEAPP,
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
