import 'package:flutter/material.dart';
import 'package:sigaamobile/index.dart';
import 'package:sigaamobile/screens/login/index.dart';
import 'package:sigaamobile/screens/minhas_notas/components/notas_view.dart';
import 'package:sigaamobile/services/mocked_data.dart';

class MinhasNotasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NotasView(data: userMockado["notas"]);
  }
}
