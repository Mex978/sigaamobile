import 'package:flutter/material.dart';

class DisciplinaScreen extends StatelessWidget {
  final String disciplina;

  DisciplinaScreen({@required this.disciplina});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).primaryColor,
        title: Text(disciplina),
      ),
    );
  }
}
