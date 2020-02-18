import 'package:flutter/material.dart';
import 'package:sigaamobile/shared/components/custom_app_bar.dart';

class DisciplinaScreen extends StatelessWidget {
  final String disciplina;

  DisciplinaScreen({@required this.disciplina});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: customAppBar(title: Text(disciplina)));
  }
}
