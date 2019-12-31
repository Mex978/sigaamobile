import 'package:flutter/material.dart';
import 'package:sigaamobile/index.dart';
import 'package:sigaamobile/screens/login/index.dart';
import 'package:sigaamobile/screens/minhas_notas/minhas_notas_bloc.dart';
import 'package:sigaamobile/shared/utils.dart';

class MinhasNotasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MinhasNotasBloc _minhasNotasBloc = BlocProvider.getBloc<MinhasNotasBloc>();
    _minhasNotasBloc.recuperarNotas();

    return Scaffold(
        appBar: AppBar(
          title: Text("Minhas Notas"),
        ),
        body: StreamBuilder<RequestState>(
          initialData: RequestState.NONE,
          stream: _minhasNotasBloc.outStateMinhasNotas,
          builder: (context, snapshot) {
            if (snapshot.data == RequestState.NONE ||
                snapshot.data == RequestState.LOADING) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return StreamBuilder<List<dynamic>>(
              initialData: [],
              stream: _minhasNotasBloc.outMinhasNotas,
              builder: (context, snapshot) {
                if (snapshot == null || !snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Theme.of(context).primaryColor,
                      height: 0,
                    );
                  },
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    var item = snapshot.data[index];
                    return Column(
                      children: <Widget>[
                        Container(
                          color: Theme.of(context).primaryColor,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 16, top: 5, bottom: 5),
                          child: Text(
                            "Período ${item["periodo"]}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columnSpacing: 0,
                            columns: item["disciplinas"][0]
                                .keys
                                .map<DataColumn>((key) {
                              String labelName;
                              if (key == "prova_final") {
                                labelName = "EF";
                              } else if (key.contains("unidade")) {
                                labelName = "U" + key[key.length - 1];
                              } else {
                                labelName = capitalize(key);
                              }
                              if (key != "codigo") {
                                return DataColumn(label: Text(labelName));
                              } else {
                                return DataColumn(label: Container());
                              }
                            }).toList(),
                            rows:
                                item["disciplinas"].map<DataRow>((disciplina) {
                              print(disciplina is Map);
                              return DataRow(
                                  cells: disciplina.keys.map<DataCell>((key) {
                                print(key);
                                if (key == "codigo" ||
                                    disciplina[key] == null) {
                                  return DataCell(Container());
                                }
                                return DataCell(Text(disciplina[key]));
                              }).toList());
                            }).toList(),
                          ),
                        )
                      ],
                    );
                  },
                );
              },
            );
          },
        ));
  }
}
