import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:sigaamobile/consts/request_state.dart';
import 'package:sigaamobile/services/api_repository.dart';
import 'package:sigaamobile/shared/utils.dart';

class LoginBloc extends BlocBase {
  ///Declarations
  ApiRepository _apiRepository = BlocProvider.getDependency<ApiRepository>();
  StreamController<Map<String, dynamic>> _userController =
      StreamController<Map<String, dynamic>>();
  StreamController<RequestState> _stateController =
      StreamController<RequestState>.broadcast();

  ///Observables
  Map<String, dynamic> _user;
  RequestState _state = RequestState.NONE;

  ///Outputs
  Stream<Map<String, dynamic>> get outUser => _userController.stream;
  Stream<RequestState> get outState => _stateController.stream;
  Map<String, dynamic> get getUser => _user;

  ///Functions
  login(String user, String pass) async {
    _state = RequestState.LOADING;
    _stateController.add(_state);
    try {
      _user = await _apiRepository.login(user, pass);
      _userController.add(_user);
      _state = RequestState.SUCCESS;
      _stateController.add(_state);
      saveDataUser(user, pass);
    } catch (e) {
      print(e);
      _state = RequestState.ERROR;
      _stateController.add(_state);
    }
  }

  Future<bool> recoverUser() async {
    final _credentials = await getDataUser();

    if (_credentials != null) {
      login(_credentials["user"], _credentials["pass"]);
      if (_state != RequestState.ERROR) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    _userController.close();
    super.dispose();
  }
}
