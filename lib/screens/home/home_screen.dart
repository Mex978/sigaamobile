import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:sigaamobile/consts/request_state.dart';
import 'package:sigaamobile/controllers/user_controller.dart';
import 'package:sigaamobile/models/user_model.dart';
import 'package:sigaamobile/screens/disciplina/disciplina_screen.dart';
import 'package:sigaamobile/screens/home/components/avatar_perfil.dart';
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
  ScrollController _scrollController;

  @override
  void initState() {
    _userController.stateLogin = RequestState.IDLE;
    _scrollController = new ScrollController();
    _scrollController.addListener(() => setState(() {}));
    super.initState();
  }

  double scrollPosition(double expandedHeight) {
    double res = expandedHeight;
    // print("expandedHeight > $expandedHeight");
    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;
      // print(offset);

      if (offset < (res - kToolbarHeight)) {
        res -= offset;
        // print("Res> $res");
      } else {
        res = kToolbarHeight;
      }
    }
    return res == kToolbarHeight ? 0 : res;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _expandedHeight = 1.8 * MediaQuery.of(context).size.height / 7;
    // User _user = _userController.user;
    //TODO: Tirar isso
    User _user = User(
        curso: "Ciencia a computacao",
        entrada: "2016.2",
        ira: "8.2",
        matricula: "20169069680",
        nome: "Max Nicolas de Oliveira Lima",
        semestre: "2020.1",
        turno: "Vespertino");
    final _name = _user.nome.toLowerCase().split(" ");

    return Scaffold(
      key: _scaffoldState,
      backgroundColor: Colors.white,
      drawer: CustomDrawer(),
      body: Observer(
        builder: (_) {
          // if (_userController.user == null)
          //   return Center(child: CircularProgressIndicator());

          double _positionAux = scrollPosition(_expandedHeight);
          double radius = 20 + 40 * (_positionAux / _expandedHeight);
          return Stack(
            children: <Widget>[
              NestedScrollView(
                controller: _scrollController,
                headerSliverBuilder: (context, _) {
                  return <Widget>[
                    SliverAppBar(
                      pinned: true,
                      floating: false,
                      flexibleSpace: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                          Color(0xFF19C2D7),
                          Color(0xFF0E98D9)
                        ])),
                      ),
                      titleSpacing: 0,
                      title: AnimatedOpacity(
                        // opacity: _positionAux == 0 ? 1 : 0,
                        opacity: 0,
                        duration: Duration(milliseconds: 300),
                        child: Row(
                          children: <Widget>[
                            AvatarPerfil(
                              user: _user,
                              radius: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              capitalize(_name[0]) +
                                  " " +
                                  capitalize(_name.last),
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      expandedHeight: _expandedHeight,
                    )
                  ];
                },
                body: _body(_positionAux, _expandedHeight),
              ),
              _container(_expandedHeight, _positionAux, _user),
              _avatar(_user, _expandedHeight, _positionAux, radius)
            ],
          );
        },
      ),
    );
  }

  _avatar(_user, _expandedHeight, _positionAux, radius) {
    return Positioned(
      top: (_positionAux / 2) -
          radius * (_positionAux / _expandedHeight) +
          MediaQuery.of(context).padding.top +
          ((kToolbarHeight - 2 * radius) / 2),
      //  top: -5,
      // left: (MediaQuery.of(context).size.width / 2) - radius,
      left: 0,
      right: 0,
      child: Opacity(
        // opacity: scrollPosition(1.8 * MediaQuery.of(context).size.height / 7) /
        //     _expandedHeight,
        opacity: 1,
        child: Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top *
                    (_positionAux / _expandedHeight)),
            alignment:
                Alignment(-0.70 + 0.7 * (_positionAux / _expandedHeight), 0),
            // padding: EdgeInsets.only(left: 50, right: (50.0 + 90)),
            child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.4), blurRadius: 10)
                ], borderRadius: BorderRadius.circular(60)),
                child: AvatarPerfil(
                  user: _user,
                  radius: radius,
                ))),
      ),
    );
  }

  _container(_expandedHeight, _positionAux, _user) {
    final _name = _user.nome.toLowerCase().split(" ");
    final _info = {
      "IRA": _user.ira,
      "Matrícula": _user.matricula,
      "Período": _user.semestre
    };
    return IgnorePointer(
      ignoring: true,
      child: Container(
        margin: EdgeInsets.only(
            left: 12 * (_positionAux / _expandedHeight),
            right: 12 * (_positionAux / _expandedHeight),
            top: (_positionAux / 2) +
                MediaQuery.of(context).padding.top -
                (MediaQuery.of(context).padding.top *
                    (1 - (_positionAux / _expandedHeight)))),
        // top: _positionAux / 2),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(_positionAux / _expandedHeight),
            boxShadow: _positionAux == 0
                ? []
                : [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.2),
                        blurRadius: 10,
                        offset: Offset(
                          0.0,
                          5.0,
                        )),
                  ],
            borderRadius:
                BorderRadius.circular(10 * (_positionAux / _expandedHeight))),
        height: _expandedHeight,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Container(
              height: _positionAux == 0 ? kToolbarHeight : null,
              alignment: Alignment(
                  -0.25 + (0.25 * (_positionAux / _expandedHeight)), 0),
              margin: EdgeInsets.only(
                  top: _positionAux == 0
                      ? MediaQuery.of(context).padding.top
                      : (70 * (_positionAux / _expandedHeight)),
                  // top: (70 * (_positionAux / _expandedHeight)) +
                  //     (((_positionAux / 2) -
                  //             35 * (_positionAux / _expandedHeight) +
                  //             MediaQuery.of(context).padding.top +
                  //             ((kToolbarHeight - 35) / 2)) *
                  //         (1 - (_positionAux / _expandedHeight))),
                  left: 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    // height: _positionAux == 0 ? kToolbarHeight : null,
                    alignment: Alignment(
                        -0.25 + (0.25 * (_positionAux / _expandedHeight)), 0),
                    // color: Colors.red,

                    child: Text(
                      capitalize(_name[0]) + " " + capitalize(_name.last),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color:
                              _positionAux == 0 ? Colors.white : Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            Text("Ciência da Computação",
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.56)
                        .withOpacity(_positionAux / _expandedHeight))),
            Expanded(
              child: Row(
                  children: _info.entries.map((entry) {
                return Expanded(
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(5)),
                    margin: EdgeInsets.only(right: 5),
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(entry.value.toString(),
                            style: TextStyle(
                                color: Colors.black.withOpacity(
                                    _positionAux / _expandedHeight),
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                        Text(entry.key.toUpperCase(),
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 0.48)
                                    .withOpacity(
                                        _positionAux / _expandedHeight),
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
    );
  }

  _body(_positionAux, _expandedHeight) {
    return Container(
      width: 5 * MediaQuery.of(context).size.height / 7,
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: ((25 + MediaQuery.of(context).size.height / 8) *
                      (_positionAux / _expandedHeight)) +
                  (MediaQuery.of(context).padding.top + kToolbarHeight + 5) *
                      (1 - (_positionAux / _expandedHeight))),
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Disciplinas",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                          color: Color.fromRGBO(0, 0, 0, 0.4), blurRadius: 5)
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
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(item.componenteCurricular,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                          Column(
                            children: item.toJson().keys.map<Widget>((key) {
                              if (key == "componente_curricular" ||
                                  key == "class_id" ||
                                  key == "form_acessarTurmaVirtual")
                                return Container();
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                              ? date_parser(item.toJson()[key])
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
    );
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
          ],
        ),
      ],
    );
  }
}
