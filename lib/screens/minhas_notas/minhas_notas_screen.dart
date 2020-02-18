import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sigaamobile/controllers/user_controller.dart';
import 'package:sigaamobile/index.dart';
import 'package:sigaamobile/screens/login/index.dart';
import 'package:sigaamobile/screens/minhas_notas/components/notas_view.dart';

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
        if (_userController.notas.isEmpty) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return NotasView(data: _userController.notas);
      },
    );
  }
}
