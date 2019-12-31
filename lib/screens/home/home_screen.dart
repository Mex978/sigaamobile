import 'package:sigaamobile/screens/minhas_notas/minhas_notas_screen.dart';

import 'index.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc _homeBloc;
  bool parameter = false;

  @override
  void initState() {
    _homeBloc = BlocProvider.getBloc<HomeBloc>();
    _homeBloc.loadUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              ],
            ),
          ),
        ),
        body: StreamBuilder<Map<String, dynamic>>(
          stream: _homeBloc.outUser,
          builder: ((context, snapshot) {
            if (snapshot.data == {} || snapshot.data == null) {
              print("Dados: ${snapshot.data}");
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            final _name = snapshot.data["nome"].toLowerCase().split(" ");

            return NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return <Widget>[
                  HeaderWidget(
                    name: _name,
                    url: snapshot.data["imagem"],
                  ),
                  SliverPersistentHeader(
                    delegate: SubHeaderWidget(info: {
                      "IRA": snapshot.data["ira"],
                      "Matrícula": snapshot.data["matricula"],
                    }),
                    pinned: true,
                  )
                ];
              },
              body: BodyWidget(
                disciplinas: [
                  "Compiladores",
                  "Programação Funcional",
                  "Segurança",
                  "Estágio Supervisionado",
                  "Tabalho de Conclusão de Curso - I"
                ],
              ),
            );
          }),
        ));
  }
}
