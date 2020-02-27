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
  bool _isExpanded = false;
  AnimationController rotationController;
  Animation<Color> _borderColor;
  final ColorTween _borderColorTween = ColorTween();
  Animatable<double> _easeOutTween = CurveTween(curve: Curves.easeOut);
  AnimationController _controller;
  Animation<double> _iconTurns;
  Animation<double> _heigthAnimation;
  Animation<Color> _headerColor;
  Animation<Color> _iconColor;

  final ColorTween _headerColorTween = ColorTween(end: Color(0xFF0E98D9));
  final ColorTween _iconColorTween = ColorTween(end: Color(0xFF0E98D9));
  final Animatable<double> _easeInTween = CurveTween(curve: Curves.bounceIn);
  final Animatable<double> _halfTween = Tween<double>(begin: 0.0, end: 0.5);

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));
    _borderColor = _controller.drive(_borderColorTween.chain(_easeOutTween));
    _heigthAnimation = _controller.drive(_easeInTween.chain(_easeInTween));
    _headerColor = _controller.drive(_headerColorTween.chain(_easeInTween));
    _iconColor = _controller.drive(_iconColorTween.chain(_easeInTween));
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
          color: _isExpanded ? widget.backgroundColor : Colors.transparent,
          border: _isExpanded
              ? Border(
                  top: BorderSide(color: Colors.grey[400]),
                  bottom: BorderSide(color: Colors.grey[400]),
                )
              : null),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                  if (_isExpanded) {
                    _controller.value = 1.0;
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
              child: ListTileTheme.merge(
                iconColor: _iconColor.value,
                textColor: _headerColor.value,
                child: ListTile(
                  title: widget.title,
                  subtitle: widget.subtitle,
                  trailing: RotationTransition(
                      turns: _iconTurns,
                      child: Icon(Icons.expand_more, color: Colors.grey[600])),
                ),
              )),
          SizeTransition(
            sizeFactor: _heigthAnimation,
            axis: Axis.vertical,
            child: Column(
              children: widget.children,
            ),
          ),
          // AnimatedContainer(
          //   height: _isExpanded ? null : 0,
          //   duration: Duration(milliseconds: 2000),
          //   child: Column(
          //     children: widget.children,
          //   ),
          // )
        ],
      ),
    );
  }
}
