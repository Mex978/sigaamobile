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
  AnimationController _controller;
  Animation<Color> _borderColor;
  Animation<double> _iconTurns;
  Animation<double> _heigthAnimation;
  Animation<Color> _headerColor;
  Animation<Color> _iconColor;
  Animation<Color> _backgroundColor;

  ColorTween _backgroundColorTween;
  final ColorTween _borderColorTween = ColorTween(end: Colors.grey[400]);
  final ColorTween _headerColorTween = ColorTween(end: Color(0xFF0E98D9));
  final ColorTween _iconColorTween = ColorTween(end: Color(0xFF0E98D9));
  final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);
  final Animatable<double> _easeOutTween = CurveTween(curve: Curves.easeOut);
  final Animatable<double> _halfTween = Tween<double>(begin: 0.0, end: 0.5);

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    _backgroundColorTween = ColorTween(end: widget.backgroundColor);

    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));
    _borderColor = _controller.drive(_borderColorTween.chain(_easeOutTween));
    _heigthAnimation = _controller.drive(_easeInTween.chain(_easeInTween));
    _headerColor = _controller.drive(_headerColorTween.chain(_easeInTween));
    _iconColor = _controller.drive(_iconColorTween.chain(_easeInTween));
    _backgroundColor = _controller.drive(_backgroundColorTween.chain(_easeInTween));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Container(
          decoration: BoxDecoration(
              color: _isExpanded ? _backgroundColor.value : Colors.transparent,
              border: _isExpanded
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
                      _isExpanded = !_isExpanded;
                      if (_isExpanded) {
                        _controller.value = 0.0;
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
                          child: Icon(Icons.expand_more,
                              color: _iconColor?.value ?? Colors.grey[600])),
                    ),
                  )),
              SizeTransition(
                sizeFactor: _heigthAnimation,
                axis: Axis.vertical,
                child: Column(
                  children: widget.children,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
