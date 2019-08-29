import 'package:event_bus_demo/Application.dart';
import 'package:event_bus_demo/event/ChangeCounterEvent.dart';
import 'package:flutter/material.dart';

class Tab2 extends StatefulWidget {
  Tab2({Key key}) : super(key: key);

  _Tab2State createState() => _Tab2State();
}

class _Tab2State extends State<Tab2> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  int _counter2 = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Application.eventBus.on<ChangeCounterEvent>().listen((event) {
      setState((){
        _counter2 = event.counter;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text(_counter2.toString())),
    );
  }
}
