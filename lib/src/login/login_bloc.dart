import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:login/src/login/login_repository.dart';
import 'package:rxdart/rxdart.dart';

import '../app_bloc.dart';

class LoginBloc extends BlocBase {
  final LoginRepository _repository;
  final AppBloc _appBloc;
  LoginBloc(this._repository, this._appBloc);

  final loadingController = BehaviorSubject.seeded(false);
  final formKey = GlobalKey<FormState>();
  final userController = TextEditingController();
  final passwordController = TextEditingController();

  String userValidate(String val) {
    if (val == null || val == "")
      return "Campo obrigatório";
    else if (val.length < 3)
      return "Mínimo de 3 caracteres";
    else
      return null;
  }

  String passValidate(String val) {
    if (val == null || val == "")
      return "Campo obrigatório";
    else if (val.length < 3)
      return "Mínimo de 3 caracteres";
    else
      return null;
  }

  void tryLogin() async {
    if (formKey.currentState.validate())
      try {
        print("Logando...");
        loadingController.add(true);

        var token = await _repository.getAccessToken(userController.text, userController.text);
        _appBloc.tokenController.add(token);

        loadingController.add(false);
        print("Logado!");
      } catch (ex) {
        loadingController.add(false);
        loadingController.addError(ex);
      } 
  }

  void closeDialog(){
    loadingController.add(false);
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    userController.dispose();
    passwordController.dispose();
    loadingController.close();
    super.dispose();
  }
}
