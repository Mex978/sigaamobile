import 'package:flutter/material.dart';
import 'package:sigaamobile/models/nota_model.dart';
import 'package:sigaamobile/screens/minhas_notas/components/notas_tab.dart';

class NotasView extends StatefulWidget {
  final List<Nota> data;

  @override
  _NotasViewState createState() => _NotasViewState();

  NotasView({this.data});
}

class _NotasViewState extends State<NotasView>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.data.length,
      child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xFF19C2D7), Color(0xFF0E98D9)])),
            ),
            centerTitle: true,
            title: Text("Minhas Notas"),
            bottom: TabBar(
              isScrollable: true,
              tabs: widget.data.map((item) {
                return Tab(
                  child: Text(item.periodo.toString()),
                );
              }).toList(),
            ),
          ),
          body: TabBarView(
            children: widget.data.map((item) {
              return NotasTab(
                item: item,
              );
            }).toList(),
          )),
    );
  }
}
