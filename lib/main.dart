import 'package:oktoast/oktoast.dart';

import 'screens/home/home_screen.dart';
import 'index.dart';

void main() => runApp(OKToast(child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return GestureDetector(
      onTap: () {
        hideKeyboard(context);
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeDefault(),
        home: HomeScreen(),
        // home: SplashScreen(),
      ),
    );
  }

  hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }
}
