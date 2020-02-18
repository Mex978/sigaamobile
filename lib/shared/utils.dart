// import 'package:shared_preferences/shared_preferences.dart';

// capitalize(String s) => s[0].toUpperCase() + s.substring(1);

// firstLetterCapitalized(String s) {
//   String stringTemp = s[0].toUpperCase() + s.substring(1).toLowerCase();
//   String string = "";
//   List<String> aux = stringTemp.split(" ");
//   for (String s in aux) {
//     if (s == "i" ||
//         s == "ii" ||
//         s == "iii" ||
//         s == "iv" ||
//         s == "v" ||
//         s == "vi" ||
//         s == "vii")
//       string += s.toUpperCase() + " ";
//     else {
//       string += s + " ";
//     }
//   }
//   return string;
// }

// Future<Map<String, String>> getDataUser() async {
//   print("Get data");
//   SharedPreferences _preferences = await SharedPreferences.getInstance();

//   final String _user = _preferences.getString("user");
//   final String _pass = _preferences.getString("pass");
//   if (_user == null || _pass == null) {
//     return null;
//   } else {
//     return {"user": _user, "pass": _pass};
//   }
// }

// saveDataUser(String user, String pass) async {
//   SharedPreferences _preferences = await SharedPreferences.getInstance();

//   _preferences.setString("user", user);
//   _preferences.setString("pass", pass);
// }

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

// ignore: non_constant_identifier_names
String date_parser(String s) {
  List<String> _lista = [], _listStrings = s.split(" ");
  for (String string in _listStrings) {
    if (string.replaceAll(" ", "") != "") _lista.add(function(string));
  }
  String _result;
  for (String item in _lista) {
    if (_result == null)
      _result = item;
    else if (item == _lista.last)
      _result += " e $item";
    else
      _result += ", $item";
  }
  return _result;
}

String function(String s) {
  String _string = s.toUpperCase();

  List _turn, days = [], times = [];

  for (String letter in _string.split("")) {
    if (!isNumeric(letter)) {
      _turn = letter == "M"
          ? ["M", "Manhã"]
          : letter == "T" ? ["T", "Tarde"] : ["N", "Noite"];
      _string = _string.replaceAll(letter, " ");
      break;
    }
  }

  List<String> listString = _string.split(" ");

  listString[0].split("").forEach((letter) => days.add(parserDate[letter]));
  listString[1]
      .split("")
      .forEach((letter) => times.add(parserTime[_turn[0]][letter]));

  times.sort((a, b) => int.parse(a[0]).compareTo(int.parse(b[0])));

  String _day = "";
  for (String day in days) {
    if (day == days.last)
      _day += day;
    else
      _day += day + ", ";
  }

  return "$_day de ${times[0][0]}:00 às ${times.last[1]}:00";
}

void main() {
  print(date_parser("6T65"));
}
