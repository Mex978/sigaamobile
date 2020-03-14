import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sigaamobile/controllers/user_controller.dart';
import 'package:sigaamobile/screens/credits/credits_screen.dart';
import 'package:sigaamobile/screens/declaracao/declaracao_screen.dart';
import 'package:sigaamobile/screens/historico/historico_screen.dart';
import 'package:sigaamobile/screens/login/login_screen.dart';
import 'package:sigaamobile/screens/minhas_notas/minhas_notas_screen.dart';

class CustomDrawer extends StatelessWidget {
  final ImageProvider logo;
  final UserController _userController = GetIt.I.get<UserController>();

  CustomDrawer({Key key, this.logo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _navigate(var screen) {
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
    }

    final List<Map> options = [
      {
        "name": "Minhas notas",
        "icon": "lib/assets/list.svg",
        "onPressed": () => _navigate(MinhasNotasScreen())
      },
      {"name": "Calendário acadêmico", "icon": "lib/assets/calendar.svg"},
      {
        "name": "Declaração de vínculo",
        "icon": "lib/assets/certificate.svg",
        "onPressed": () => _navigate(DeclaracaoScreen())
      },
      {
        "name": "Histórico",
        "icon": "lib/assets/history.svg",
        "onPressed": () => _navigate(HistoricoScreen())
      },
      {
        "name": "Créditos",
        "icon": "lib/assets/pikachu.svg",
        "onPressed": () => _navigate(CreditsScreen())
      }
    ];

    return Drawer(
      child: Container(
        color: Color.fromRGBO(0, 0, 0, 0),
        // padding: EdgeInsets.only(top: 40),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFF19C2D7), Color(0xFF0E98D9)])),
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 30, bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: logo,
                      radius: 40,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "SIGAA Mobile",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        Text(
                          "Universidade Federal do Piauí",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.white60),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: options.map<Widget>((item) {
                    return Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: item["onPressed"] ??
                            () => showToastWidget(
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[400],
                                      borderRadius: BorderRadius.circular(100)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 15),
                                  child: Text("Em breve!"),
                                ),
                                position: ToastPosition.bottom,
                                duration: Duration(milliseconds: 850)),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                                title: Text(
                                  item["name"],
                                  style: TextStyle(shadows: [
                                    // Shadow(blurRadius: 5, color: Colors.black)
                                  ], color: Colors.blue),
                                ),
                                leading: item["icon"] is String
                                    ? Container(
                                        child: SvgPicture.asset(item["icon"]),
                                        width: 20,
                                        height: 20,
                                      )
                                    : item["icon"]),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              width: double.infinity,
                              height: 1,
                              color: Colors.black12,
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
                                        _userController.logout();
                                        Navigator.pop(context);
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginScreen(),
                                                settings: RouteSettings(
                                                    isInitialRoute: true)));
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
                              // shadows: [
                              //   Shadow(blurRadius: 2, color: Colors.black)
                              // ],
                            ),
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
