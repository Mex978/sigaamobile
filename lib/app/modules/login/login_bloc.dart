import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:sigaamobile/app/app_module.dart';
import 'package:sigaamobile/app/consts.dart';
import 'package:sigaamobile/app/repositorys/api_repository.dart';

class LoginBloc extends BlocBase {
  ///Declarations
  ApiRepository _apiRepository = AppModule.to.getDependency<ApiRepository>();
  StreamController<Map<String, dynamic>> _userController =
      StreamController<Map<String, dynamic>>();
  StreamController<RequestState> _stateController =
      StreamController<RequestState>.broadcast();

  ///Observables
  Map<String, dynamic> _user = {};
  RequestState _state = RequestState.NONE;

  ///Outputs
  Stream<Map<String, dynamic>> get outUser => _userController.stream;
  Stream<RequestState> get outState => _stateController.stream;
  Map<String, dynamic> get getUser => _user;

  ///Functions
  login(String user, String pass) async {
    _state = RequestState.LOADING;
    _stateController.add(_state);
    _user = await _apiRepository.login(user, pass);
    _userController.add(_user);
    _state = RequestState.SUCCESS;
    _stateController.add(_state);
  }

  @override
  void dispose() {
    _userController.close();
    super.dispose();
  }
}
