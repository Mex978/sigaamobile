import 'package:flutter/material.dart';
import 'package:sigaamobile/models/nota_model.dart';
import 'package:sigaamobile/screens/minhas_notas/components/custom_expansion_tile.dart';
import 'package:sigaamobile/shared/utils.dart';

class NotasView extends StatefulWidget {
  final List<Nota> data;

  @override
  _NotasViewState createState() => _NotasViewState();

  NotasView({this.data});
}

class _NotasViewState extends State<NotasView>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.data.length,
      child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xFF19C2D7), Color(0xFF0E98D9)])),
            ),
            centerTitle: true,
            title: Text("Minhas Notas"),
            bottom: TabBar(
              isScrollable: true,
              tabs: widget.data.map((item) {
                return Tab(
                  child: Text(item.periodo.toString()),
                );
              }).toList(),
            ),
          ),
          body: TabBarView(
            children: widget.data.map((item) {
              return SingleChildScrollView(
                  child: Column(
                children: item.disciplinas.map<Widget>((disciplina) {
                  return Column(
                    children: <Widget>[
                      CustomExpansionTile(
                        backgroundColor: disciplina.situacao != null &&
                                disciplina.situacao != "--"
                            ? disciplina.situacao == "AM" ||
                                    (disciplina.situacao == "EF" &&
                                        disciplina.resultado != "--")
                                ? Color.fromRGBO(119, 221, 119, 0.4)
                                : Color.fromRGBO(255, 0, 0, 0.4)
                            : Color.fromRGBO(0, 0, 0, 0.2),
                        title: Text("${disciplina.disciplina}",
                            style: TextStyle(fontSize: 16)),
                        subtitle: Text(
                          "${disciplina.codigo}",
                          style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4)),
                        ),
                        children:
                            disciplina.toJson().keys.map<Widget>((String key) {
                          return _tileDisciplina(key, disciplina.toJson());
                        }).toList(),
                      ),
                      ExpansionTile(
                        backgroundColor: disciplina.situacao != null &&
                                disciplina.situacao != "--"
                            ? disciplina.situacao == "AM" ||
                                    (disciplina.situacao == "EF" &&
                                        disciplina.resultado != "--")
                                ? Color.fromRGBO(119, 221, 119, 0.4)
                                : Color.fromRGBO(255, 0, 0, 0.4)
                            : Color.fromRGBO(0, 0, 0, 0.2),
                        title: Text(
                          "${disciplina.disciplina}",
                        ),
                        subtitle: Text(
                          "${disciplina.codigo}",
                          style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4)),
                        ),
                        children: <Widget>[Text("Teste")],
                      )
                    ],
                  );
                }).toList(),
              ));
            }).toList(),
          )),
    );
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
        // decoration: BoxDecoration(
        //     color: Colors.white, borderRadius: BorderRadius.circular(4)),
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
}
