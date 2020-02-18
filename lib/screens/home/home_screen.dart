import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:sigaamobile/consts/request_state.dart';
import 'package:sigaamobile/controllers/user_controller.dart';
import 'package:sigaamobile/models/user_model.dart';
import 'package:sigaamobile/screens/disciplina/disciplina_screen.dart';
import 'package:sigaamobile/screens/home/components/drawer/drawer_widget.dart';
import 'package:sigaamobile/shared/scroll_behavior.dart';
import 'package:sigaamobile/shared/utils.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({Key key, this.title = "Home"}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool aux = false;
  bool parameter = false;
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  final _userController = GetIt.I.get<UserController>();

  @override
  void initState() {
    _userController.stateLogin = RequestState.IDLE;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      backgroundColor: Colors.white,
      drawer: CustomDrawer(),
      body: Observer(
        builder: (_) {
          if (_userController.user == null)
            return Center(child: CircularProgressIndicator());
          return _body();
        },
      ),
    );
  }

  _body() {
    final _userController = GetIt.I.get<UserController>();
    User _user = _userController.user;
    final _name = _user.nome.toLowerCase().split(" ");
    final _info = {
      "IRA": _user.ira,
      "Matrícula": _user.matricula,
      "Período": _user.semestre
    };
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                // color: Color(0xFF16A0E2),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFF19C2D7), Color(0xFF0E98D9)])),
                height: 200,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Expanded(
              flex: 5,
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: ListView(
                  padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 25 + MediaQuery.of(context).size.height / 8),
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Disciplinas",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                  ]..addAll(_userController.disciplinas.map<Widget>((item) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                            // color: Color(0xFF195A79),
                            // color: Colors.white,
                            gradient: LinearGradient(
                                colors: [Color(0xFF19C2D7), Color(0xFF0E98D9)]),
                            borderRadius: BorderRadius.circular(5),
                            // border: Border.all(color: Color(0xFF16A0E2)),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.4),
                                  blurRadius: 5)
                            ]),
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(5),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(5),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => DisciplinaScreen(
                                            disciplina: firstLetterCapitalized(
                                                item.componenteCurricular),
                                          )));
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(item.componenteCurricular,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600)),
                                  Column(
                                    children:
                                        item.toJson().keys.map<Widget>((key) {
                                      if (key == "componente_curricular" ||
                                          key == "class_id" ||
                                          key == "form_acessarTurmaVirtual")
                                        return Container();
                                      return Row(
                                        children: <Widget>[
                                          Text(
                                            "${capitalize(key)}: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Colors.white),
                                          ),
                                          Expanded(
                                              child: Text(
                                                  key == "horario"
                                                      ? date_parser(
                                                          item.toJson()[key])[0]
                                                      : item.toJson()[key],
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white)))
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
                    }).toList()),
                ),
              ),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(
              left: 12, right: 12, top: MediaQuery.of(context).size.height / 7),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                    blurRadius: 10,
                    offset: Offset(
                      0.0,
                      5.0,
                    )),
              ],
              borderRadius: BorderRadius.circular(10)),
          height: 2 * MediaQuery.of(context).size.height / 7,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Column(
              children: <Widget>[
                Text(
                  capitalize(_name[0]) + " " + capitalize(_name.last),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text("Ciência da Computação",
                    style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.56))),
                Expanded(
                  child: Row(
                      children: _info.entries.map((entry) {
                    return Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)),
                        margin: EdgeInsets.only(right: 5),
                        padding: EdgeInsets.symmetric(horizontal: 2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(entry.value.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)),
                            Text(entry.key.toUpperCase(),
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 0.48),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14)),
                          ],
                        ),
                      ),
                    );
                  }).toList()),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: (MediaQuery.of(context).size.height / 7) - 60,
          left: 50,
          right: 50,
          child: Container(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.4), blurRadius: 10)
                ], borderRadius: BorderRadius.circular(60)),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Stack(
                    children: <Widget>[
                      SvgPicture.asset("lib/assets/user.svg"),
                      if (_user.imagem != null)
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(_user.imagem),
                          radius: 60,
                        ),
                    ],
                  ),
                  radius: 60,
                ),
              )),
        ),
        Positioned(
          top: (MediaQuery.of(context).size.height / 7) - 22,
          left: 50,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60), color: Colors.white),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(60),
                onTap: () {
                  _scaffoldState.currentState.openDrawer();
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.menu,
                    color: Color(0xFF19C2D7),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
