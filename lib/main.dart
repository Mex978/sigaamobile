import 'package:get_it/get_it.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sigaamobile/controllers/user_controller.dart';
import 'index.dart';

void main() {
  GetIt.I.registerSingleton<ApiRepository>(ApiRepository());
  GetIt.I.registerSingleton<UserController>(UserController());
  runApp(OKToast(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light));
    return GestureDetector(
      onTap: () {
        hideKeyboard(context);
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeDefault(),
        home: SplashScreen(),
      ),
    );
  }

  hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }
}
