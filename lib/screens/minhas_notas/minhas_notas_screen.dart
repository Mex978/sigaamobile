import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sigaamobile/controllers/user_controller.dart';
import 'package:sigaamobile/index.dart';
import 'package:sigaamobile/screens/login/index.dart';
import 'package:sigaamobile/screens/minhas_notas/components/notas_view.dart';

import '../../consts/request_state.dart';

class MinhasNotasScreen extends StatefulWidget {
  @override
  _MinhasNotasScreenState createState() => _MinhasNotasScreenState();
}

class _MinhasNotasScreenState extends State<MinhasNotasScreen> {
  final _userController = GetIt.I.get<UserController>();

  @override
  void initState() {
    _userController.loadNotas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        switch (_userController.stateNotas) {
          case RequestState.SUCCESS:
            return NotasView(data: _userController.notas.toList());
            break;
          case RequestState.LOADING:
          default:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
        }
      },
    );
  }
}
