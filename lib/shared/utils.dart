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

Map parserDate = {
  "1": "Dom",
  "2": "Seg",
  "3": "Ter",
  "4": "Qua",
  "5": "Qui",
  "6": "Sex",
  "7": "Sáb"
};

Map parserTime = {
  "M": {
    "1": ["06", "07"],
    "2": ["07", "08"],
    "3": ["08", "09"],
    "4": ["09", "10"],
    "5": ["10", "11"],
    "6": ["11", "12"]
  },
  "T": {
    "1": ["12", "13"],
    "2": ["13", "14"],
    "3": ["14", "15"],
    "4": ["15", "16"],
    "5": ["16", "17"],
    "6": ["17", "18"]
  },
  "N": {
    "1": ["18", "19"],
    "2": ["19", "20"],
    "3": ["20", "21"],
    "4": ["21", "22"]
  }
};

List<String> date_parser(String s) {
  // return [s];
  List<String> _lista = [];
  List<String> _list_strings = s.split(" ");
  for (String string in _list_strings) _lista.add(function(string));
  return _lista;
}

bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  try {
    double.parse(s);
    return true;
  } catch (e) {
    return false;
  }
}

String function(String s) {
  String _string = s.toUpperCase();
  print(s);

  List _turn;
  List days = [];
  List times = [];

  for (int i = 0; i < _string.length; i++) {
    String _letter = _string[i];
    if (!isNumeric(_letter)) {
      _turn = _letter == "M"
          ? ["M", "Manhã"]
          : _letter == "T" ? ["T", "Tarde"] : ["N", "Noite"];
      break;
    }
  }

  _string =
      _string.replaceAll("M", " ").replaceAll("T", " ").replaceAll("N", " ");
  List<String> list_string = _string.split(" ");
  print("check 1");
  print(list_string);
  print(_string);
  for (int i = 0; i < list_string[0].length; i++)
    days.add(parserDate[list_string[0][i]]);

  for (int i = 0; i < list_string[1].length; i++) {
    print("key: ${_turn[0]}");
    print("second key: ${list_string[1][i]}");
    times.add(parserTime[_turn[0]][list_string[1][i]]);
  }

  String _day = "";
  for (String day in days) {
    if (day == days.last)
      _day += day;
    else
      _day += day + ", ";
  }
  // String _day = ", ".join([day for day in days]);
  print(times);
  print("----------------------------------");
  String _time = "${times[0][0]}:00 às ${times.last[1]}:00";

  return "$_day de $_time";
}
