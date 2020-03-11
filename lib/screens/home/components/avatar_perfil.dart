import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sigaamobile/models/user_model.dart';

class AvatarPerfil extends StatelessWidget {
  final User user;
  final double radius;

  const AvatarPerfil({Key key, this.user, this.radius: 60}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "perfil",
      child: GestureDetector(
        onTap: () {
          showDialog(
              barrierDismissible: true,
              context: context,
              child: Hero(
                tag: "perfil",
                child: Dialog(
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(5)),
                    padding: EdgeInsets.all(5),
                    child: Image.network(
                      user.imagem,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ));
        },
        child: ClipOval(
          // backgroundColor: Colors.transparent,
          child: Container(
            height: radius * 2,
            width: radius * 2,
            child: Stack(
              children: <Widget>[
                SvgPicture.asset("lib/assets/user.svg"),
                if (user.imagem != null)
                  ClipOval(
                    // backgroundColor: Colors.transparent,
                    child: Container(
                      height: radius * 2,
                      width: radius * 2,
                      child: Image.network(
                        user.imagem,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    // radius: radius,
                  ),
              ],
            ),
          ),
          // radius: radius,
        ),
      ),
    );
  }
}
