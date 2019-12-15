import 'package:flutter/material.dart';

class SubHeaderWidget extends StatelessWidget {
  final Map<String, dynamic> info;

  SubHeaderWidget({@required this.info});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      padding: EdgeInsets.symmetric(vertical: 5),
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
}
