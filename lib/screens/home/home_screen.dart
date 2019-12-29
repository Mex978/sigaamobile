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
            }

            final _name = snapshot.data["Nome"].toLowerCase().split(" ");

            return NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return <Widget>[
                  HeaderWidget(
                    name: _name,
                    url: snapshot.data["Imagem"],
                  ),
                  SliverPersistentHeader(
                    delegate: SubHeaderWidget(info: {
                      "IRA": snapshot.data["IRA"],
                      "Matrícula": snapshot.data["Matrícula"],
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
