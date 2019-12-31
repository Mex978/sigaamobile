import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:sigaamobile/consts/request_state.dart';
import 'package:sigaamobile/index.dart';

class MinhasNotasBloc extends BlocBase {
  List<dynamic> _minhasNotas;
  RequestState _state;

  ApiRepository _apiRepository = BlocProvider.getDependency<ApiRepository>();

  StreamController<List<dynamic>> _minhasNotasController =
      BehaviorSubject<List<dynamic>>();
  StreamController<RequestState> _stateMinhasNotas =
      BehaviorSubject<RequestState>();

  Stream<List<dynamic>> get outMinhasNotas => _minhasNotasController.stream;
  Stream<RequestState> get outStateMinhasNotas => _stateMinhasNotas.stream;

  recuperarNotas() async {
    try {
      _state = RequestState.LOADING;
      _stateMinhasNotas.add(_state);
      _minhasNotas = await _apiRepository.notas();
      _minhasNotasController.add(_minhasNotas);
      _state = RequestState.SUCCESS;
      _stateMinhasNotas.add(_state);
    } catch (e) {
      _state = RequestState.ERROR;
      _stateMinhasNotas.add(_state);
    }
  }

  @override
  void dispose() {
    _minhasNotasController.close();
    _stateMinhasNotas.close();
    super.dispose();
  }
}
