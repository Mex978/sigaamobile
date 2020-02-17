import 'package:flutter_svg/flutter_svg.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sigaamobile/screens/disciplina/disciplina_screen.dart';
import 'package:sigaamobile/screens/home/components/drawer/drawer_widget.dart';
import 'package:sigaamobile/screens/lista_disciplinas/lista_disciplinas.dart';
import 'package:sigaamobile/screens/login/login_screen.dart';
import 'package:sigaamobile/screens/minhas_notas/minhas_notas_screen.dart';
import 'package:sigaamobile/services/mocked_data.dart';
import 'package:sigaamobile/shared/utils.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _name = userMockado["nome"].toLowerCase().split(" ");
    return Scaffold(
        backgroundColor: Color(0xFFFEFCB9),
        // backgroundColor: Color(0xFF152F94),
        // backgroundColor: Color(0xFF2B6FD9),
        key: _scaffoldState,
        drawer: CustomDrawer(),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              HeaderWidget(
                title: "Bem-vindo",
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
          body: _body(disciplinas: userMockado["disciplinas"]),
        ));
  }

  _body({List disciplinas}) {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: disciplinas.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
              color: Color(0xFF152F94),
              borderRadius: BorderRadius.circular(2),
              boxShadow: [
                BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.3), blurRadius: 4)
              ]),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(2),
            child: InkWell(
              borderRadius: BorderRadius.circular(2),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => DisciplinaScreen(
                              disciplina: firstLetterCapitalized(
                                  disciplinas[index]["componente_curricular"]),
                            )));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      disciplinas[index]["componente_curricular"],
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white),
                    ),
                    Column(
                      children: disciplinas[index].keys.map<Widget>((key) {
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
                                            disciplinas[index][key])[0]
                                        : disciplinas[index][key],
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white)))
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
      },
    );
  }

  // _gridMain() {
  //   return GridView.count(
  //     padding: EdgeInsets.all(15),
  //     crossAxisSpacing: 15,
  //     crossAxisCount: 2,
  //     children: options.map<Widget>((item) {
  //       return Padding(
  //         padding: const EdgeInsets.only(bottom: 15.0),
  //         child: Container(
  //           width: double.infinity,
  //           height: double.infinity,
  //           decoration: BoxDecoration(
  //               color: Colors.white,
  //               boxShadow: [
  //                 BoxShadow(
  //                     color: Color.fromRGBO(0, 0, 0, 0.25), blurRadius: 10)
  //               ],
  //               borderRadius: BorderRadius.circular(5)),
  //           child: Material(
  //             color: Colors.transparent,
  //             borderRadius: BorderRadius.circular(5),
  //             child: InkWell(
  //               borderRadius: BorderRadius.circular(5),
  //               onTap: () {
  //                 switch (item["name"]) {
  //                   case "Disciplinas":
  //                     Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                             builder: (_) => ListaDisciplinasScreen(
  //                                 disciplinas: userMockado["disciplinas"])));
  //                     break;
  //                   case "Minhas notas":
  //                     Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                             builder: (context) => MinhasNotasScreen()));
  //                     break;
  //                   default:
  //                     showToastWidget(
  //                         Container(
  //                           decoration: BoxDecoration(
  //                               color: Colors.grey[400],
  //                               borderRadius: BorderRadius.circular(100)),
  //                           padding: EdgeInsets.symmetric(
  //                               horizontal: 30, vertical: 15),
  //                           child: Text("Em breve!"),
  //                         ),
  //                         position: ToastPosition.bottom,
  //                         duration: Duration(milliseconds: 850));
  //                 }
  //               },
  //               child: Center(
  //                   child: Padding(
  //                 padding: const EdgeInsets.all(15.0),
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: <Widget>[
  //                     Container(
  //                       child: SvgPicture.asset(item["icon"]),
  //                       width: 50,
  //                       height: 50,
  //                     ),
  //                     SizedBox(
  //                       height: 5,
  //                     ),
  //                     Row(
  //                       children: <Widget>[
  //                         Expanded(
  //                             child: Text(
  //                           item["name"],
  //                           textAlign: TextAlign.center,
  //                         )),
  //                       ],
  //                     )
  //                   ],
  //                 ),
  //               )),
  //             ),
  //           ),
  //         ),
  //       );
  //     }).toList(),
  //   );
  // }
}
