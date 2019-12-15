import 'package:flutter/material.dart';
import 'package:sigaamobile/app/modules/home/body/body_widget.dart';
import 'package:sigaamobile/app/modules/home/header/header_widget.dart';
import 'package:sigaamobile/app/modules/home/home_module.dart';
import 'package:sigaamobile/app/modules/home/sub_header/sub_header_widget.dart';

import 'home_bloc.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc _homeBloc;

  @override
  void initState() {
    _homeBloc = HomeModule.to.getBloc<HomeBloc>();
    _homeBloc.loadUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Container(
            color: Colors.white,
            width: (3 * MediaQuery.of(context).size.width) / 4),
        body: StreamBuilder<Map<String, dynamic>>(
          stream: _homeBloc.outUser,
          builder: ((context, snapshot) {
            if (snapshot.data == {} || snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final _name = snapshot.data["Nome"].toLowerCase().split(" ");
              return Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  HeaderWidget(
                    url: snapshot.data["Imagem"],
                    name:
                        "${_capitalize(_name[0])} ${_capitalize(_name[_name.length - 1])}",
                    course: snapshot.data["Curso"],
                  ),
                  SubHeaderWidget(info: {
                    "IRA": snapshot.data["IRA"],
                    "Matrícula": snapshot.data["Matrícula"],
                  }),
                  BodyWidget(
                    disciplinas: [
                      "Compiladores",
                      "Programação Funcional",
                      "Segurança",
                      "Estágio Supervisionado",
                      "Tabalho de Conclusão de Curso - 1"
                    ],
                  )
                ],
              );
            }
          }),
        ),
      ),
    );
  }

  String _capitalize(String s) => s[0].toUpperCase() + s.substring(1);
}
