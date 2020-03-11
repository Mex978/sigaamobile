// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserController on _UserControllerBase, Store {
  final _$userAtom = Atom(name: '_UserControllerBase.user');

  @override
  User get user {
    _$userAtom.context.enforceReadPolicy(_$userAtom);
    _$userAtom.reportObserved();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.context.conditionallyRunInAction(() {
      super.user = value;
      _$userAtom.reportChanged();
    }, _$userAtom, name: '${_$userAtom.name}_set');
  }

  final _$disciplinasAtom = Atom(name: '_UserControllerBase.disciplinas');

  @override
  ObservableList<Disciplina> get disciplinas {
    _$disciplinasAtom.context.enforceReadPolicy(_$disciplinasAtom);
    _$disciplinasAtom.reportObserved();
    return super.disciplinas;
  }

  @override
  set disciplinas(ObservableList<Disciplina> value) {
    _$disciplinasAtom.context.conditionallyRunInAction(() {
      super.disciplinas = value;
      _$disciplinasAtom.reportChanged();
    }, _$disciplinasAtom, name: '${_$disciplinasAtom.name}_set');
  }

  final _$notasAtom = Atom(name: '_UserControllerBase.notas');

  @override
  ObservableList<Nota> get notas {
    _$notasAtom.context.enforceReadPolicy(_$notasAtom);
    _$notasAtom.reportObserved();
    return super.notas;
  }

  @override
  set notas(ObservableList<Nota> value) {
    _$notasAtom.context.conditionallyRunInAction(() {
      super.notas = value;
      _$notasAtom.reportChanged();
    }, _$notasAtom, name: '${_$notasAtom.name}_set');
  }

  final _$recoveredAtom = Atom(name: '_UserControllerBase.recovered');

  @override
  bool get recovered {
    _$recoveredAtom.context.enforceReadPolicy(_$recoveredAtom);
    _$recoveredAtom.reportObserved();
    return super.recovered;
  }

  @override
  set recovered(bool value) {
    _$recoveredAtom.context.conditionallyRunInAction(() {
      super.recovered = value;
      _$recoveredAtom.reportChanged();
    }, _$recoveredAtom, name: '${_$recoveredAtom.name}_set');
  }

  final _$declaracaoAtom = Atom(name: '_UserControllerBase.declaracao');

  @override
  Declaracao get declaracao {
    _$declaracaoAtom.context.enforceReadPolicy(_$declaracaoAtom);
    _$declaracaoAtom.reportObserved();
    return super.declaracao;
  }

  @override
  set declaracao(Declaracao value) {
    _$declaracaoAtom.context.conditionallyRunInAction(() {
      super.declaracao = value;
      _$declaracaoAtom.reportChanged();
    }, _$declaracaoAtom, name: '${_$declaracaoAtom.name}_set');
  }

  final _$historicoAtom = Atom(name: '_UserControllerBase.historico');

  @override
  Historico get historico {
    _$historicoAtom.context.enforceReadPolicy(_$historicoAtom);
    _$historicoAtom.reportObserved();
    return super.historico;
  }

  @override
  set historico(Historico value) {
    _$historicoAtom.context.conditionallyRunInAction(() {
      super.historico = value;
      _$historicoAtom.reportChanged();
    }, _$historicoAtom, name: '${_$historicoAtom.name}_set');
  }

  final _$stateLoginAtom = Atom(name: '_UserControllerBase.stateLogin');

  @override
  RequestState get stateLogin {
    _$stateLoginAtom.context.enforceReadPolicy(_$stateLoginAtom);
    _$stateLoginAtom.reportObserved();
    return super.stateLogin;
  }

  @override
  set stateLogin(RequestState value) {
    _$stateLoginAtom.context.conditionallyRunInAction(() {
      super.stateLogin = value;
      _$stateLoginAtom.reportChanged();
    }, _$stateLoginAtom, name: '${_$stateLoginAtom.name}_set');
  }

  final _$stateNotasAtom = Atom(name: '_UserControllerBase.stateNotas');

  @override
  RequestState get stateNotas {
    _$stateNotasAtom.context.enforceReadPolicy(_$stateNotasAtom);
    _$stateNotasAtom.reportObserved();
    return super.stateNotas;
  }

  @override
  set stateNotas(RequestState value) {
    _$stateNotasAtom.context.conditionallyRunInAction(() {
      super.stateNotas = value;
      _$stateNotasAtom.reportChanged();
    }, _$stateNotasAtom, name: '${_$stateNotasAtom.name}_set');
  }

  final _$stateDeclaracaoAtom =
      Atom(name: '_UserControllerBase.stateDeclaracao');

  @override
  RequestState get stateDeclaracao {
    _$stateDeclaracaoAtom.context.enforceReadPolicy(_$stateDeclaracaoAtom);
    _$stateDeclaracaoAtom.reportObserved();
    return super.stateDeclaracao;
  }

  @override
  set stateDeclaracao(RequestState value) {
    _$stateDeclaracaoAtom.context.conditionallyRunInAction(() {
      super.stateDeclaracao = value;
      _$stateDeclaracaoAtom.reportChanged();
    }, _$stateDeclaracaoAtom, name: '${_$stateDeclaracaoAtom.name}_set');
  }

  final _$stateHistoricoAtom = Atom(name: '_UserControllerBase.stateHistorico');

  @override
  RequestState get stateHistorico {
    _$stateHistoricoAtom.context.enforceReadPolicy(_$stateHistoricoAtom);
    _$stateHistoricoAtom.reportObserved();
    return super.stateHistorico;
  }

  @override
  set stateHistorico(RequestState value) {
    _$stateHistoricoAtom.context.conditionallyRunInAction(() {
      super.stateHistorico = value;
      _$stateHistoricoAtom.reportChanged();
    }, _$stateHistoricoAtom, name: '${_$stateHistoricoAtom.name}_set');
  }

  final _$recoverUserAsyncAction = AsyncAction('recoverUser');

  @override
  Future recoverUser() {
    return _$recoverUserAsyncAction.run(() => super.recoverUser());
  }

  final _$recoverDeclaracaoAsyncAction = AsyncAction('recoverDeclaracao');

  @override
  Future recoverDeclaracao() {
    return _$recoverDeclaracaoAsyncAction.run(() => super.recoverDeclaracao());
  }

  final _$recoverHistoricoAsyncAction = AsyncAction('recoverHistorico');

  @override
  Future recoverHistorico() {
    return _$recoverHistoricoAsyncAction.run(() => super.recoverHistorico());
  }

  final _$loginAsyncAction = AsyncAction('login');

  @override
  Future login({String userTemp, String passTemp}) {
    return _$loginAsyncAction
        .run(() => super.login(userTemp: userTemp, passTemp: passTemp));
  }

  @override
  String toString() {
    final string =
        'user: ${user.toString()},disciplinas: ${disciplinas.toString()},notas: ${notas.toString()},recovered: ${recovered.toString()},declaracao: ${declaracao.toString()},historico: ${historico.toString()},stateLogin: ${stateLogin.toString()},stateNotas: ${stateNotas.toString()},stateDeclaracao: ${stateDeclaracao.toString()},stateHistorico: ${stateHistorico.toString()}';
    return '{$string}';
  }
}
