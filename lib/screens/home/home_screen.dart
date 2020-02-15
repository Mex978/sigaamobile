import 'package:flutter_svg/flutter_svg.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sigaamobile/screens/lista_disciplinas/lista_disciplinas.dart';
import 'package:sigaamobile/screens/login/login_screen.dart';
import 'package:sigaamobile/screens/minhas_notas/minhas_notas_screen.dart';
import 'package:sigaamobile/services/mocked_data.dart';
import 'index.dart';

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

  List<Map> options = [
    {"name": "Disciplinas", "icon": "lib/assets/books.svg"},
    {"name": "Minhas notas", "icon": "lib/assets/list.svg"},
    {"name": "Calendário acadêmico", "icon": "lib/assets/calendar.svg"},
    {"name": "Atestado de matrícula", "icon": "lib/assets/certificate.svg"}
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _name = userMockado["nome"].toLowerCase().split(" ");
    return Scaffold(
        key: _scaffoldState,
        drawer: Drawer(
          child: Padding(
            padding: EdgeInsets.only(top: 32),
            child: Column(
              children: <Widget>[
                ListTile(
                  enabled: true,
                  leading: Icon(Icons.school),
                  title: Text("Ver notas"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MinhasNotasScreen()));
                  },
                ),
                ListTile(
                  enabled: true,
                  leading: Icon(Icons.exit_to_app, color: Colors.red),
                  title: Text(
                    "Logout",
                    style: TextStyle(color: Colors.red),
                  ),
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
                                          builder: (context) => LoginScreen()));
                                },
                              )
                            ],
                          );
                        });
                  },
                )
              ],
            ),
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            print(innerBoxIsScrolled);
            return <Widget>[
              HeaderWidget(
                name: _name,
                url: userMockado["imagem"],
              ),
              SliverPersistentHeader(
                delegate: SubHeaderWidget(info: {
                  "IRA": userMockado["ira"],
                  "Matrícula": userMockado["matricula"],
                  "Período": userMockado["periodo"]
                }),
                pinned: true,
              )
            ];
          },
          body: _gridMain(),
        ));
  }

  _gridMain() {
    return GridView.count(
      padding: EdgeInsets.all(15),
      crossAxisSpacing: 15,
      crossAxisCount: 2,
      children: options.map<Widget>((item) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.25), blurRadius: 10)
                ],
                borderRadius: BorderRadius.circular(5)),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(5),
              child: InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: () {
                  switch (item["name"]) {
                    case "Disciplinas":
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ListaDisciplinasScreen(
                                  disciplinas: userMockado["disciplinas"])));
                      break;
                    case "Minhas notas":
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MinhasNotasScreen()));
                      break;
                    default:
                      showToastWidget(
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[400],
                                borderRadius: BorderRadius.circular(100)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            child: Text("Em breve!"),
                          ),
                          position: ToastPosition.bottom,
                          duration: Duration(milliseconds: 850));
                  }
                },
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: SvgPicture.asset(item["icon"]),
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: Text(
                            item["name"],
                            textAlign: TextAlign.center,
                          )),
                        ],
                      )
                    ],
                  ),
                )),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
