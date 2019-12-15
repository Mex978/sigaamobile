import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:sigaamobile/app/app_module.dart';
import 'package:sigaamobile/app/modules/login/login_bloc.dart';

class HomeBloc extends BlocBase {
  Map<String, dynamic> _user = {};

  StreamController<Map<String, dynamic>> _userController =
      StreamController<Map<String, dynamic>>();

  LoginBloc _loginBloc = AppModule.to.getBloc<LoginBloc>();

  Stream<Map<String, dynamic>> get outUser => _userController.stream;

  loadUser() {
    _user = _loginBloc.getUser;
    _userController.add(_user);
  }

  @override
  void dispose() {
    _userController.close();
    super.dispose();
  }
}
