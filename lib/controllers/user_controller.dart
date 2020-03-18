import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sigaamobile/consts/request_state.dart';
import 'package:sigaamobile/models/declaracao_model.dart';
import 'package:sigaamobile/models/nota_model.dart';
import 'package:sigaamobile/models/user_model.dart';
import 'package:sigaamobile/services/api_repository.dart';
import 'package:sigaamobile/shared/utils.dart';
import 'package:sigaamobile/models/disciplina_model.dart';
import 'package:sigaamobile/models/historico_model.dart';

import '../consts/request_state.dart';
part 'user_controller.g.dart';

class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {
  @observable
  User user;

  @observable
  ObservableList<Disciplina> disciplinas = ObservableList<Disciplina>();

  @observable
  ObservableList<Nota> notas = ObservableList<Nota>();

  @observable
  bool recovered;

  @observable
  Declaracao declaracao;

  @observable
  Historico historico;

  @observable
  RequestState stateLogin, stateNotas, stateDeclaracao, stateHistorico;

  final _api = GetIt.I.get<ApiRepository>();

  @action
  recoverUser() async {
    final Map<String, String> _credentials = await getDataUser();
    if (_credentials != null) {
      return login(
          userTemp: _credentials["user"], passTemp: _credentials["pass"]);
    } else {
      stateLogin = RequestState.ERROR;
    }
  }

  @action
  recoverDeclaracao() async {
    stateDeclaracao = RequestState.LOADING;
    declaracao = null;
    Map<String, dynamic> _temp = await _api.declaracao();
    declaracao = Declaracao.fromJson(_temp);
    stateDeclaracao = RequestState.SUCCESS;
  }

  @action
  recoverHistorico() async {
    stateHistorico = RequestState.LOADING;
    historico = null;
    Map<String, dynamic> _temp = await _api.historico();
    historico = Historico.fromJson(_temp);
    stateHistorico = RequestState.SUCCESS;
  }

  @action
  login({String userTemp, String passTemp}) async {
    stateLogin = RequestState.LOADING;
    await _api.login(userTemp, passTemp).then((json) async {
      user = User.fromJson(json);
      await saveDataUser(userTemp, passTemp);
      disciplinas.clear();
      await _loadDisciplinas();
      stateLogin = RequestState.SUCCESS;
    }).catchError((e) {
      stateLogin = RequestState.ERROR;
    });
  }

  _loadDisciplinas() async {
    List _temp = await _api.disciplinas();
    for (Map<String, dynamic> json in _temp) {
      disciplinas.add(Disciplina.fromJson(json));
    }
  }

  loadNotas() async {
    stateNotas = RequestState.LOADING;
    notas.clear();
    List _temp = await _api.notas();
    for (Map<String, dynamic> json in _temp) {
      notas.add(Nota.fromJson(json));
    }
    stateNotas = RequestState.SUCCESS;
  }

  logout() {
    user = null;
    saveDataUser(null, null);
  }
}
