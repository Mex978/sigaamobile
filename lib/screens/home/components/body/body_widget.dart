import 'package:flutter/material.dart';
import 'components/body_tile.dart';

class BodyWidget extends StatelessWidget {
  final List<String> disciplinas;

  BodyWidget({@required this.disciplinas});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 32, bottom: 32),
      itemCount: disciplinas.length,
      itemBuilder: (context, index) => bodyTile(context, index, disciplinas),
    );
  }
}
