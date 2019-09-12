import 'package:bloc_pattern/bloc_pattern.dart';

import '../app_bloc.dart';

class HomeBloc extends BlocBase {
  final AppBloc _appBloc;

  HomeBloc(this._appBloc);

  void logout(){
    _appBloc.tokenController.add(null);
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    super.dispose();
  }
}
