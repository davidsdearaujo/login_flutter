import 'package:flutter/material.dart';
import 'package:login/src/app_module.dart';
import 'package:login/src/home/home_module.dart';

import 'app_bloc.dart';
import 'login/login_module.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppBloc bloc = AppModule.to.bloc();
    return MaterialApp(
      title: 'Flutter Slidy - Login System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder<String>(
        stream: bloc.tokenController,
        builder: (context, snapshot) {
          if (snapshot.hasData)
            return HomeModule();
          else
            return LoginModule();
        },
      ),
    );
  }
}
