import 'package:flutter/material.dart';
import 'package:sigaamobile/app/modules/home/home_module.dart';

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
    _homeBloc.loadUser();
    return Scaffold(
      body: StreamBuilder<Map<String, dynamic>>(
        initialData: {},
        stream: _homeBloc.outUser,
        builder: ((context, snapshot) {
          final _name = snapshot.data["Nome"].toLowerCase().split(" ");
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _text(
                  "Bem-vindo ${_capitalize(_name[0])} ${_capitalize(_name[_name.length - 1])}"),
              _divider(),
              _label(
                  title: "Matrícula:",
                  content: "${snapshot.data["Matrícula"]}"),
              _divider(),
              _label(title: "Curso:", content: "${snapshot.data["Curso"]}"),
              _divider(),
              _label(title: "IRA:", content: "${snapshot.data["IRA"]}")
            ],
          );
        }),
      ),
    );
  }

  _text(String content) => Text(
        content,
        textAlign: TextAlign.center,
        style: TextStyle(),
      );
  _label({String title, String content}) => Column(
        children: <Widget>[
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(content)
        ],
      );
  _divider() => Divider(
        color: Colors.transparent,
      );
  String _capitalize(String s) => s[0].toUpperCase() + s.substring(1);
}
