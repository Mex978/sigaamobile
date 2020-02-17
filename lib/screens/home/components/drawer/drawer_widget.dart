import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sigaamobile/screens/lista_disciplinas/lista_disciplinas.dart';
import 'package:sigaamobile/screens/login/login_screen.dart';
import 'package:sigaamobile/screens/minhas_notas/minhas_notas_screen.dart';
import 'package:sigaamobile/services/mocked_data.dart';

class CustomDrawer extends StatelessWidget {
  final List<Map> options = [
    {"name": "Minhas notas", "icon": "lib/assets/list.svg"},
    {"name": "Calendário acadêmico", "icon": "lib/assets/calendar.svg"},
    {"name": "Atestado de matrícula", "icon": "lib/assets/certificate.svg"}
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFF2B6FD9),
        padding: EdgeInsets.only(top: 40),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(userMockado["imagem"]),
                      radius: 50,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Max Lima",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    // Text(
                    //   "max.lima2@gmail.com",
                    //   style: TextStyle(fontSize: 12, color: Colors.white),
                    // ),
                    // Text(
                    //   "Ciência da Computação",
                    //   style: TextStyle(fontSize: 12, color: Colors.white),
                    // )
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: options.map<Widget>((item) {
                    return Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          switch (item["name"]) {
                            case "Disciplinas":
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ListaDisciplinasScreen(
                                          disciplinas:
                                              userMockado["disciplinas"])));
                              break;
                            case "Minhas notas":
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MinhasNotasScreen()));
                              break;
                            default:
                              showToastWidget(
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[400],
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 15),
                                    child: Text("Em breve!"),
                                  ),
                                  position: ToastPosition.bottom,
                                  duration: Duration(milliseconds: 850));
                          }
                        },
                        child: Column(
                          children: <Widget>[
                            ListTile(
                                title: Text(
                                  item["name"],
                                  style: TextStyle(shadows: [
                                    Shadow(blurRadius: 5, color: Colors.black)
                                  ], color: Colors.white),
                                ),
                                leading: Container(
                                  child: SvgPicture.asset(item["icon"]),
                                  width: 20,
                                  height: 20,
                                )),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              width: double.infinity,
                              height: 1,
                              color: Colors.white12,
                            )
                          ],
                        ),
                      ),
                    );
                  }).toList()
                    ..add(Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                    "Fazer Logout",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  content: Text(
                                      "Você confirma que deseja fazer logout da aplicação?"),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text("Cancelar",
                                          style: TextStyle(color: Colors.red)),
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                    FlatButton(
                                      child: Text("Confirmar"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginScreen()));
                                      },
                                    )
                                  ],
                                );
                              });
                        },
                        child: ListTile(
                          enabled: true,
                          leading: Icon(Icons.exit_to_app, color: Colors.red),
                          title: Text(
                            "Logout",
                            style: TextStyle(
                                color: Colors.red,
                                shadows: [
                                  Shadow(blurRadius: 2, color: Colors.black)
                                ],
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    )),
                ),
              )
            ]),
      ),
    );
  }
}
