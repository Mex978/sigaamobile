import 'dart:ui';

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
                  SliverAppBar(
                      expandedHeight: 150.0,
                      floating: false,
                      pinned: true,
                      leading: IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: Icon(Icons.menu),
                      ),
                      actions: <Widget>[
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    insetAnimationCurve: Curves.fastOutSlowIn,
                                    insetAnimationDuration:
                                        Duration(milliseconds: 300),
                                    child: Image.network(
                                      snapshot.data["Imagem"],
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                });
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(snapshot.data["Imagem"]),
                              minRadius: 23,
                            ),
                          ),
                        )
                      ],
                      flexibleSpace: FlexibleSpaceBar(
                          collapseMode: CollapseMode.parallax,
                          centerTitle: true,
                          // title: HeaderWidget(
                          //   url: snapshot.data["Imagem"],
                          //   name:
                          //       "${_capitalize(_name[0])} ${_capitalize(_name[_name.length - 1])}",
                          //   course: snapshot.data["Curso"],
                          // ),
                          title: Text(
                              "${_capitalize(_name[0])} ${_capitalize(_name[_name.length - 1])}"),
                          background: Container(
                            decoration: new BoxDecoration(
                              image: new DecorationImage(
                                image: NetworkImage(snapshot.data["Imagem"]),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: new BackdropFilter(
                              filter: new ImageFilter.blur(
                                  sigmaX: 10.0, sigmaY: 10.0),
                              child: new Container(
                                decoration: new BoxDecoration(
                                    color: Colors.white.withOpacity(0.0)),
                              ),
                            ),
                          ))),
                  SliverPersistentHeader(
                    delegate: SubHeaderWidget(info: {
                      "IRA": snapshot.data["IRA"],
                      "Matrícula": snapshot.data["Matrícula"],
                    }),
                    pinned: true,
                  )
                  // SliverPersistentHeader(
                  //   delegate: SubHeaderWidget(info: {
                  //     "IRA": snapshot.data["IRA"],
                  //     "Matrícula": snapshot.data["Matrícula"],
                  //   }),
                  //   pinned: true,
                  // ),
                ];
              },
              body: BodyWidget(
                disciplinas: [
                  "Compiladores",
                  "Programação Funcional",
                  "Segurança",
                  "Estágio Supervisionado",
                  "Tabalho de Conclusão de Curso - 1"
                ],
              ),
            );

            // return Column(
            //   // mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: <Widget>[
            //     HeaderWidget(
            //       url: snapshot.data["Imagem"],
            //       name:
            //           "${_capitalize(_name[0])} ${_capitalize(_name[_name.length - 1])}",
            //       course: snapshot.data["Curso"],
            //     ),
            //     // SubHeaderWidget(info: {
            //     //   "IRA": snapshot.data["IRA"],
            //     //   "Matrícula": snapshot.data["Matrícula"],
            //     // }),
            //   ],
            // );
          }),
        ));
  }

  String _capitalize(String s) => s[0].toUpperCase() + s.substring(1);
}
