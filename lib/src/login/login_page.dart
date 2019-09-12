import 'package:flutter/material.dart';
import 'package:loading_button/loading_button.dart';

import 'login_bloc.dart';
import 'login_module.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginBloc bloc = LoginModule.to.bloc();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(title: Text("Login")),
          body: Padding(
            padding: const EdgeInsets.all(25),
            child: Form(
              key: bloc.formKey,
              autovalidate: true,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: bloc.userController,
                    decoration: InputDecoration(labelText: "User"),
                    validator: bloc.userValidate,
                  ),
                  TextFormField(
                    controller: bloc.passwordController,
                    decoration: InputDecoration(labelText: "Password"),
                    validator: bloc.passValidate,
                  ),
                  SizedBox(height: 15),
                  StreamBuilder<bool>(
                    stream: bloc.loadingController,
                    initialData: bloc.loadingController.value,
                    builder: (context, snapshot) {
                      return LoadingButton(
                        onPressed: bloc.tryLogin,
                        isLoading: snapshot.data ?? false,
                        child: Text(
                          "Entrar",
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        StreamBuilder<bool>(
          stream: bloc.loadingController,
          builder: (context, snapshot) {
            return Offstage(
              offstage: !snapshot.hasError,
              child: Container(
                color: Colors.black26,
                child: AlertDialog(
                  title: Text("Oops"),
                  content: Text(snapshot.error ?? ""),
                  actions: <Widget>[OutlineButton(child: Text("Ok"), onPressed: bloc.closeDialog,)],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
