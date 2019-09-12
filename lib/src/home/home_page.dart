import 'package:flutter/material.dart';

import '../app_bloc.dart';
import '../app_module.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AppBloc appBloc = AppModule.to.bloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => appBloc.tokenController.add(null),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
