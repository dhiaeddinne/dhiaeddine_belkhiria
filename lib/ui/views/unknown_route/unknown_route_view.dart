import 'package:flutter/material.dart';

class UnknownRouteView extends StatefulWidget {
  @override
  _UnknownRouteViewState createState() => _UnknownRouteViewState();
}

class _UnknownRouteViewState extends State<UnknownRouteView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Unknown Route"),
      ),
    );
  }
}
