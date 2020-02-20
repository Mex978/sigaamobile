import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sigaamobile/models/user_model.dart';

class AvatarPerfil extends StatelessWidget {
  final User user;
  final double radius;

  const AvatarPerfil({Key key, this.user, this.radius: 60}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      child: Stack(
        children: <Widget>[
          SvgPicture.asset("lib/assets/user.svg"),
          if (user.imagem != null)
            CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(user.imagem),
              radius: radius,
            ),
        ],
      ),
      radius: radius,
    );
  }
}
