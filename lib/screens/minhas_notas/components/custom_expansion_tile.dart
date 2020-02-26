import 'dart:math';

import 'package:flutter/material.dart';

class CustomExpansionTile extends StatefulWidget {
  final Color backgroundColor;
  final Text title;
  final Text subtitle;
  final List<Widget> children;
  const CustomExpansionTile(
      {Key key, this.backgroundColor, this.title, this.subtitle, this.children})
      : super(key: key);

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;
  AnimationController rotationController;
  Animation<Color> _borderColor;
  final ColorTween _borderColorTween = ColorTween();
  Animatable<double> _easeOutTween = CurveTween(curve: Curves.easeOut);
  AnimationController _controller;
  Animation<double> _iconTurns;
  final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);
  final Animatable<double> _halfTween = Tween<double>(begin: 0.0, end: 0.5);

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));
    _borderColor = _controller.drive(_borderColorTween.chain(_easeOutTween));

    // rotationController = AnimationController(
    //     duration: const Duration(milliseconds: 300), vsync: this);
  }

  @override
  void didChangeDependencies() {
    final ThemeData theme = Theme.of(context);
    _borderColorTween..end = theme.dividerColor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isExpanded ? widget.backgroundColor : Colors.transparent,
          border: isExpanded
              ? Border(
                  top: BorderSide(
                      color: _borderColor.value ?? Colors.transparent),
                  bottom: BorderSide(
                      color: _borderColor.value ?? Colors.transparent),
                )
              : null),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                  if (isExpanded) {
                    _controller.forward();
                  } else {
                    _controller.reverse().then<void>((void value) {
                      if (!mounted) return;
                      setState(() {
                        // Rebuild without widget.children.
                      });
                    });
                  }
                });
              },
              child: ListTile(
                title: widget.title,
                subtitle: widget.subtitle,
                trailing: RotationTransition(
                    turns: _iconTurns,
                    child: Icon(Icons.expand_more, color: Colors.grey[600])),
              )

              // Container(
              //   padding: EdgeInsets.all(16),
              //   width: MediaQuery.of(context).size.width,
              //   child: Row(
              //     children: <Widget>[
              //       Expanded(
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: <Widget>[
              //             widget.title,
              //             widget.subtitle,
              //           ],
              //         ),
              //       ),
              //       RotationTransition(
              //           turns: _iconTurns,
              //           child: Icon(Icons.expand_more, color: Colors.grey[600])),
              //     ],
              //   ),
              // ),
              ),
          AnimatedContainer(
            height: isExpanded ? null : 0,
            duration: Duration(milliseconds: 2000),
            child: Column(
              children: widget.children,
            ),
          )
        ],
      ),
    );
  }
}
