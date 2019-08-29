import 'package:event_bus_demo/Application.dart';
import 'package:event_bus_demo/event/ChangeCounterEvent.dart';
import 'package:flutter/material.dart';

class Tab1 extends StatefulWidget {
  Tab1({Key key}) : super(key: key);

  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  int _counter1 = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Application.eventBus.on<ChangeCounterEvent>().listen((event) {
      setState(() {
        _counter1 = event.counter;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text(_counter1.toString())),
    );
  }
}
