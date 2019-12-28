import 'package:flutter/material.dart';

class BodyWidget extends StatelessWidget {
  final List<String> disciplinas;

  BodyWidget({@required this.disciplinas});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(top: 15),
        itemCount: disciplinas.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(blurRadius: 5, color: Color.fromRGBO(0, 0, 0, 0.6))
                ]),
            child: FlatButton(
              color: Colors.white,
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(
                      color: Color.fromRGBO(0, 0, 0, 0.4), width: 0.5)),
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Text(disciplinas[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
