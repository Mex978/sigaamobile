import 'package:flutter/material.dart';
import 'package:sigaamobile/shared/utils.dart';

class NotasView extends StatefulWidget {
  final List<dynamic> data;

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
            centerTitle: true,
            title: Text("Minhas Notas"),
            bottom: TabBar(
              isScrollable: true,
              tabs: widget.data.map((item) {
                return Tab(
                  child: Text(item["periodo"].toString()),
                );
              }).toList(),
            ),
          ),
          body: TabBarView(
            children: widget.data.map((item) {
              return ListView.builder(
                itemCount: item["disciplinas"].length,
                itemBuilder: (context, index) {
                  var disciplina = item['disciplinas'][index];
                  return ExpansionTile(
                    backgroundColor: disciplina["situacao"] != null
                        ? disciplina["situacao"] == "AM"
                            ? Color.fromRGBO(119, 221, 119, 0.4)
                            : Color.fromRGBO(255, 0, 0, 0.6)
                        : Color.fromRGBO(0, 0, 0, 0.4),
                    title: Text("${disciplina["disciplina"]}"),
                    subtitle: Text(
                      "${disciplina["codigo"]}",
                      style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4)),
                    ),
                    children: disciplina.keys.map<Widget>((String key) {
                      return _tileDisciplina(key, disciplina);
                    }).toList(),
                  );
                },
              );
            }).toList(),
          )),
    );
  }

  Widget _tileDisciplina(String key, var disciplina) {
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
      print(key);
      return Container(
        margin: EdgeInsets.only(
            bottom: key == "situacao" ? 20 : 2, top: 2, left: 5, right: 5),
        // decoration: BoxDecoration(
        //     color: Colors.white, borderRadius: BorderRadius.circular(4)),
        child: ListTile(
          title: Text(labelName),
          subtitle: disciplina[key] != null
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
