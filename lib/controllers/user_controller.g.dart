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

  final _$loginAsyncAction = AsyncAction('login');

  @override
  Future login({String userTemp, String passTemp}) {
    return _$loginAsyncAction
        .run(() => super.login(userTemp: userTemp, passTemp: passTemp));
  }

  @override
  String toString() {
    final string =
        'user: ${user.toString()},disciplinas: ${disciplinas.toString()},notas: ${notas.toString()},stateLogin: ${stateLogin.toString()}';
    return '{$string}';
  }
}
