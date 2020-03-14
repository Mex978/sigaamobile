import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sigaamobile/models/user_model.dart';

class HeroDialogueRoute<T> extends PageRoute<T> {
  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Color get barrierColor => Colors.black54;

  @override
  String get barrierLabel => "ok";

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
      child: child,
    );
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  HeroDialogueRoute({this.builder});
  final WidgetBuilder builder;
}

class AvatarPerfil extends StatelessWidget {
  final User user;
  final double radius;

  const AvatarPerfil({Key key, this.user, this.radius: 60}) : super(key: key);

  String getAvatarName() {
    List<String> list = user.nome.split(" ");
    var name1 = list[0];
    var name2 = list.last;

    return name1[0].toUpperCase() + name2[0].toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, HeroDialogueRoute(builder: (context) {
          return GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(
                    left: 0.4 * MediaQuery.of(context).size.width / 10,
                    right: 0.4 * MediaQuery.of(context).size.width / 10,
                    top: MediaQuery.of(context).padding.top + 4,
                    bottom: MediaQuery.of(context).size.height / 3.8),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Text(
                          "Imagem de perfil",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Hero(
                          tag: "perfil",
                          child: Image.network(
                            user.imagem,
                            fit: BoxFit.fill,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
        // showDialog(
        //     barrierDismissible: true,
        //     context: context,
        //     child: Dialog(
        //       child: Container(
        //         decoration:
        //             BoxDecoration(borderRadius: BorderRadius.circular(5)),
        //         padding: EdgeInsets.all(5),
        //         child: Hero(
        //           tag: "perfil",
        //           child: Image.network(
        //             user.imagem,
        //             fit: BoxFit.fill,
        //           ),
        //         ),
        //       ),
        //     ));
      },
      child: ClipOval(
        // backgroundColor: Colors.transparent,
        child: Container(
          height: radius * 2,
          width: radius * 2,
          child: Stack(
            children: <Widget>[
              // SvgPicture.asset("lib/assets/user.svg"),
              if (user.imagem != null)
                Container(
                  color: Colors.white,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              if (user.imagem != null)
                ClipOval(
                  // backgroundColor: Colors.transparent,
                  child: Container(
                    height: radius * 2,
                    width: radius * 2,
                    child: Hero(
                      tag: "perfil",
                      child: Image.network(
                        user.imagem,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
              if (user.imagem == null)
                Container(
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: Text(
                    getAvatarName(),
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
                  ),
                )
            ],
          ),
        ),
        // radius: radius,
      ),
    );
  }
}
