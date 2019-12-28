import 'index.dart';

void main() => runApp(BlocProvider(
      blocs: [Bloc((i) => LoginBloc()), Bloc((i) => HomeBloc())],
      dependencies: [Dependency((i) => ApiRepository())],
      child: MaterialApp(
        theme: ThemeData(
            fontFamily: "Open Sans",
            backgroundColor: Color.fromRGBO(250, 250, 250, 1)),
        home: SplashScreen(),
      ),
    ));
