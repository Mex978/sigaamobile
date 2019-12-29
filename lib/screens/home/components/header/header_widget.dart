import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String url;
  final String name;
  final String course;

  HeaderWidget(
      {@required this.url, @required this.name, @required this.course});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        child: Column(
          children: <Widget>[
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(50.0),
            //   child: FadeInImage(
            //       fit: BoxFit.cover,
            //       width: 100,
            //       height: 100,
            //       placeholder:
            //           AssetImage("lib/assets/profile_placeholder.png"),
            //       image: NetworkImage(snapshot.data["Imagem"])),
            // ),
            // CircleAvatar(
            //   radius: 51,
            //   backgroundColor: Colors.black,
            //   child: CircleAvatar(
            //     radius: 50,
            //     backgroundImage: NetworkImage(snapshot.data["Imagem"]),
            //   ),
            // ),
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(url),
            ),
            _divider(),
            Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            _divider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                course,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  _divider() {
    return Divider(color: Colors.transparent);
  }
}
