import 'package:shared_preferences/shared_preferences.dart';

capitalize(String s) => s[0].toUpperCase() + s.substring(1);

firstLetterCapitalized(String s) {
  String stringTemp = s[0].toUpperCase() + s.substring(1).toLowerCase();
  String string = "";
  List<String> aux = stringTemp.split(" ");
  for (String s in aux) {
    if (s == "i" ||
        s == "ii" ||
        s == "iii" ||
        s == "iv" ||
        s == "v" ||
        s == "vi" ||
        s == "vii")
      string += s.toUpperCase() + " ";
    else {
      string += s + " ";
    }
  }
  return string;
}

Future<Map<String, String>> getDataUser() async {
  print("Get data");
  SharedPreferences _preferences = await SharedPreferences.getInstance();

  final String _user = _preferences.getString("user");
  final String _pass = _preferences.getString("pass");
  if (_user == null || _pass == null) {
    return null;
  } else {
    return {"user": _user, "pass": _pass};
  }
}

saveDataUser(String user, String pass) async {
  SharedPreferences _preferences = await SharedPreferences.getInstance();

  _preferences.setString("user", user);
  _preferences.setString("pass", pass);
}
