import 'package:flutter/material.dart';
import 'package:sigaamobile/screens/disciplina/disciplina_screen.dart';

bodyTile(BuildContext context, int index, List<String> disciplinas) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(blurRadius: 3, color: Color.fromRGBO(0, 0, 0, 0.6))
        ]),
    child: FlatButton(
      color: Colors.white,
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DisciplinaScreen(
                      disciplina: disciplinas[index],
                    )));
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.4), width: 0.5)),
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Text(
          disciplinas[index],
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
    ),
  );
}
