import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:sigaamobile/screens/login/login_bloc.dart';

class HomeBloc extends BlocBase {
  ///Declarations
  LoginBloc _loginBloc = BlocProvider.getBloc<LoginBloc>();

  ///Observables
  Map<String, dynamic> _user = {};

  ///Controllers
  StreamController<Map<String, dynamic>> _userController =
      StreamController<Map<String, dynamic>>();

  ///Outputs
  Stream<Map<String, dynamic>> get outUser => _userController.stream;

  stayLogged() async {
    while (true) {
      Future.delayed(Duration(minutes: 30), () {
        _loginBloc.recoverUser();
      });
    }
  }

  ///Fucntions
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
