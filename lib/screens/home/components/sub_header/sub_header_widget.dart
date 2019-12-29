import 'package:flutter/material.dart';

class SubHeaderWidget extends SliverPersistentHeaderDelegate {
  final Map<String, dynamic> info;

  SubHeaderWidget({@required this.info});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.orange,
      padding: EdgeInsets.symmetric(vertical: 5),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: info.entries.map((entry) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                Text(
                  entry.key.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.normal),
                ),
                Text(entry.value.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18)),
              ],
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
    // TODO: implement shouldRebuild
    return false;
  }
}
