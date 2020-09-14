import 'package:flutter/material.dart';
import 'package:runner/screens/location.dart';

class TabUI extends StatelessWidget {
  final List<Widget> _tabs = [
    Tab(icon: Icon(Icons.location_on)),
  ];

  @override
  Widget build(BuildContext context) {
    int _length = _tabs.length;
    return MaterialApp(
      home: DefaultTabController(
        length: _length,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: _tabs,
            ),
            title: Text('Learn Flutter'),
            backgroundColor: Colors.green[200],
          ),
          body: TabBarView(
            children: [
              LocationSample(),
            ],
          ),
        ),
      ),
    );
  }
}
