import 'package:flutter/material.dart';

class SubHeaderWidget extends SliverPersistentHeaderDelegate {
  final Map<String, dynamic> info;

  SubHeaderWidget({@required this.info});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      // color: Color(0xFF2B6FD9),
      color: Color(0xFFFEFCB9),
      padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 5),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: info.entries.map((entry) {
          return Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFF152F94),
                  borderRadius: BorderRadius.circular(2)),
              margin: EdgeInsets.only(right: 5),
              padding: EdgeInsets.symmetric(horizontal: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(entry.key.toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 14)),
                  Text(entry.value.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16)),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
