import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sigaamobile/shared/utils.dart';

class HeaderWidget extends StatelessWidget {
  final String url;
  final String title;
  final List<String> name;
  final String course;

  HeaderWidget({@required this.url, this.name, this.course, this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        backgroundColor: Color(0xFF152F94),
        expandedHeight: 150.0,
        floating: false,
        elevation: 0,
        pinned: true,
        leading: _leanding(context),
        // actions: _actions(context),
        flexibleSpace: _flexibleSpace(context));
  }

  _leanding(BuildContext context) {
    return IconButton(
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
      icon: Icon(Icons.menu),
    );
  }

  _actions(BuildContext context) {
    return <Widget>[
      GestureDetector(
        onTap: () {
          _showPerfilImage(context);
        },
        child: Padding(
          padding: EdgeInsets.only(top: 5, bottom: 5, right: 15),
          child: CircleAvatar(
            backgroundImage: NetworkImage(url),
            minRadius: 23,
          ),
        ),
      )
    ];
  }

  _flexibleSpace(BuildContext context) {
    return FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        centerTitle: true,
        title: name == null
            ? Text(title)
            : Text(
                "${capitalize(name[0])} ${capitalize(name[name.length - 1])}",
                style: TextStyle(
                    shadows: [Shadow(color: Colors.black, blurRadius: 5)]),
              ),
        background: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(url),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
            ),
          ),
        ));
  }

  _showPerfilImage(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            insetAnimationCurve: Curves.fastOutSlowIn,
            insetAnimationDuration: Duration(milliseconds: 300),
            child: Image.network(
              url,
              fit: BoxFit.cover,
            ),
          );
        });
  }
}
