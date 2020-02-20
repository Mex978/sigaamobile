import 'package:sigaamobile/index.dart';

showErroDialog({@required BuildContext context, @required String content}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Erro",
            style: TextStyle(color: Colors.black),
          ),
          content: Text(content),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
      });
}
