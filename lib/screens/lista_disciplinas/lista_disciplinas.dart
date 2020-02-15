import 'package:flutter/material.dart';
import 'package:sigaamobile/screens/disciplina/disciplina_screen.dart';
import 'package:sigaamobile/shared/utils.dart';

class ListaDisciplinasScreen extends StatelessWidget {
  final List disciplinas;

  const ListaDisciplinasScreen({Key key, this.disciplinas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Disciplinas"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(15),
        itemCount: disciplinas.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.3), blurRadius: 10)
                ]),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => DisciplinaScreen(
                                disciplina: firstLetterCapitalized(
                                    disciplinas[index]
                                        ["componente_curricular"]),
                              )));
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        disciplinas[index]["componente_curricular"],
                        overflow: TextOverflow.ellipsis,
                      ),
                      Column(
                        children: disciplinas[index].keys.map<Widget>((key) {
                          if (key == "componente_curricular" ||
                              key == "class_id" ||
                              key == "form_acessarTurmaVirtual")
                            return Container();
                          return Row(
                            children: <Widget>[
                              Text(
                                "${capitalize(key)}: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              Expanded(
                                  child: Text(disciplinas[index][key],
                                      style: TextStyle(fontSize: 12)))
                            ],
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
