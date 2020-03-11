import 'package:flutter/material.dart';
import 'package:sigaamobile/models/nota_model.dart';
import 'package:sigaamobile/screens/minhas_notas/components/custom_expansion_tile.dart';
import 'package:sigaamobile/shared/utils.dart';

class NotasTab extends StatefulWidget {
  final Nota item;

  const NotasTab({Key key, this.item}) : super(key: key);

  @override
  _NotasTabState createState() => _NotasTabState();
}

class _NotasTabState extends State<NotasTab>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
        child: Column(
      children: widget.item.disciplinas.map<Widget>((disciplina) {
        return CustomExpansionTile(
          backgroundColor:
              disciplina.situacao != null && disciplina.situacao != "--"
                  ? disciplina.situacao == "AM" ||
                          (disciplina.situacao == "EF" &&
                              disciplina.resultado != "--")
                      ? Color.fromRGBO(119, 221, 119, 0.4)
                      : Color.fromRGBO(255, 0, 0, 0.4)
                  : Color.fromRGBO(0, 0, 0, 0.2),
          title:
              Text("${disciplina.disciplina}", style: TextStyle(fontSize: 16)),
          subtitle: Text(
            "${disciplina.codigo}",
            style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4)),
          ),
          children: disciplina.toJson().keys.map<Widget>((String key) {
            return disciplina.toJson()[key] == null ||
                    disciplina.toJson()[key] == "--"
                ? Container()
                : _tileDisciplina(key, disciplina.toJson());
          }).toList(),
        );
      }).toList(),
    ));
  }

  Widget _tileDisciplina(String key, Map<String, dynamic> disciplina) {
    String labelName;
    if (key == "prova_final") {
      labelName = "EF";
    } else if (key.contains("unidade")) {
      labelName = "Nota " + key[key.length - 1];
    } else {
      labelName = capitalize(key);
    }

    if (key == "codigo" || key == "disciplina") {
      return Container();
    } else {
      return Container(
        margin: EdgeInsets.only(
            bottom: key == "situacao" ? 20 : 2, top: 2, left: 5, right: 5),
        child: ListTile(
          title: Text(labelName),
          subtitle: disciplina[key] != null && disciplina[key] != "--"
              ? (key.toString().contains("unidade") ||
                      key.toString().contains("resultado") ||
                      key.toString().contains("prova_final"))
                  ? double.parse(disciplina[key]
                              .toString()
                              .replaceAll(",", ".")) >=
                          7.0
                      ? Text(
                          disciplina[key],
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        )
                      : Text(
                          disciplina[key],
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        )
                  : Text(disciplina[key])
              : Text(
                  "Sem informações",
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
        ),
      );
    }
  }

  @override
  bool get wantKeepAlive => true;
}
