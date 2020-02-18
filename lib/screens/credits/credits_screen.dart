import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sigaamobile/screens/login/index.dart';
import 'package:sigaamobile/shared/components/custom_app_bar.dart';

class CreditsScreen extends StatelessWidget {
  final _users = [
    {
      "name": "Max Nícolas",
      "funcao": "Frontend",
      "image": "lib/assets/max.png"
    },
    {"name": "João Pedro", "funcao": "Backend", "image": "lib/assets/jp.png"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: Text("Créditos")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 16),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xFF19C2D7), Color(0xFF0E98D9)]),
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.56), blurRadius: 5)
                  ]),
              child: Column(
                children: <Widget>[sigaaLogo()],
              ),
            ),
            Container(
              child: Text(
                "Developers",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: _users.map<Widget>((user) {
                  return Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      // gradient: LinearGradient(
                      //     colors: [Color(0xFF19C2D7), Color(0xFF0E98D9)]),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.2), blurRadius: 10)
                      ],
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage(user["image"]),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              user["name"],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                            Text(user["funcao"],
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14))
                          ],
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child:
                                    SvgPicture.asset("lib/assets/twitter.svg"),
                                width: 40,
                                height: 40,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                  child:
                                      SvgPicture.asset("lib/assets/github.svg"),
                                  width: 40,
                                  height: 40)
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }).toList()
                  ..insert(
                      1,
                      SizedBox(
                        height: 15,
                      )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
