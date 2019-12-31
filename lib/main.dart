import 'package:sigaamobile/screens/minhas_notas/minhas_notas_bloc.dart';

import 'index.dart';

void main() => runApp(GestureDetector(
      onTap: () {
        hideKeyboard();
      },
      child: BlocProvider(
        blocs: [
          Bloc((i) => LoginBloc()),
          Bloc((i) => HomeBloc()),
          Bloc((i) => MinhasNotasBloc())
        ],
        dependencies: [Dependency((i) => ApiRepository())],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeDefault(),
          home: SplashScreen(),
        ),
      ),
    ));

hideKeyboard() {
  SystemChannels.textInput.invokeMethod('TextInput.hide');
}
