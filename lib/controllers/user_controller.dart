import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sigaamobile/consts/request_state.dart';
import 'package:sigaamobile/models/nota_model.dart';
import 'package:sigaamobile/models/user_model.dart';
import 'package:sigaamobile/services/api_repository.dart';
import 'package:sigaamobile/shared/utils.dart';
import 'package:sigaamobile/models/disciplina_model.dart';
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
  RequestState stateLogin;

  final _api = GetIt.I.get<ApiRepository>();

  @action
  login({String userTemp, String passTemp}) async {
    stateLogin = RequestState.LOADING;
    _api.login(userTemp, passTemp).then((json) async {
      user = User.fromJson(json);
      await saveDataUser(userTemp, passTemp);
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
    stateLogin = RequestState.LOADING;
    notas.clear();
    List _temp = await _api.notas();
    for (Map<String, dynamic> json in _temp) {
      notas.add(Nota.fromJson(json));
    }
    stateLogin = RequestState.SUCCESS;
  }
}
