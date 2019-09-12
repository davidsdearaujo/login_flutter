import 'package:login/src/login/login_repository.dart';
import 'package:login/src/login/login_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:login/src/login/login_page.dart';

import '../app_module.dart';

class LoginModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => LoginBloc(i.get(), AppModule.to.bloc())),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => LoginRepository()),
      ];

  @override
  Widget get view => LoginPage();

  static Inject get to => Inject<LoginModule>.of();
}
