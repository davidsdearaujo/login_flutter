import 'package:bloc_pattern/bloc_pattern.dart';

class LoginRepository extends Disposable {

  Future<String> getAccessToken(String user, String password) async {
    await Future.delayed(Duration(seconds: 3));
    // throw "Usuário ou senha inválidos!";
    return "token de teste";
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {}
}
