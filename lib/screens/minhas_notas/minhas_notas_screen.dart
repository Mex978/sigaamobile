import 'package:flutter/material.dart';
import 'package:sigaamobile/index.dart';
import 'package:sigaamobile/screens/login/index.dart';
import 'package:sigaamobile/screens/minhas_notas/components/notas_view.dart';
import 'package:sigaamobile/screens/minhas_notas/minhas_notas_bloc.dart';

class MinhasNotasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MinhasNotasBloc _minhasNotasBloc = BlocProvider.getBloc<MinhasNotasBloc>();
    _minhasNotasBloc.recuperarNotas();

    return StreamBuilder<RequestState>(
      initialData: RequestState.NONE,
      stream: _minhasNotasBloc.outStateMinhasNotas,
      builder: (context, snapshot) {
        if (snapshot.data == RequestState.NONE ||
            snapshot.data == RequestState.LOADING) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("Minhas Notas"),
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return StreamBuilder<List<dynamic>>(
            initialData: [],
            stream: _minhasNotasBloc.outMinhasNotas,
            builder: (context, snapshot) {
              if (snapshot == null || !snapshot.hasData) {
                return Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    title: Text("Minhas Notas"),
                  ),
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              return NotasView(data: snapshot.data);
            });
      },
    );
  }
}
