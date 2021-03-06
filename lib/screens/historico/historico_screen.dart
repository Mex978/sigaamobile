import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sigaamobile/index.dart';

import '../../consts/request_state.dart';
import '../../controllers/user_controller.dart';
import '../../shared/components/custom_app_bar.dart';

class HistoricoScreen extends StatefulWidget {
  @override
  _HistoricoScreenState createState() => _HistoricoScreenState();
}

class _HistoricoScreenState extends State<HistoricoScreen> {
  final _userController = GetIt.I.get<UserController>();
  @override
  void initState() {
    _userController.recoverHistorico();
    super.initState();
  }

  Future<File> createPdf(String pdfBase64) async {
    Uint8List bytes = base64.decode(pdfBase64);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File(
        "$dir/" + DateTime.now().millisecondsSinceEpoch.toString() + ".pdf");
    await file.writeAsBytes(bytes);
    return file;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        switch (_userController.stateHistorico) {
          case RequestState.SUCCESS:
            return FutureBuilder<File>(
              future: createPdf(_userController.historico.image),
              builder:
                  (BuildContext context, AsyncSnapshot<File> snapshotFile) {
                if (!snapshotFile.hasData) {
                  return Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return PDFViewerScaffold(
                  appBar:
                      customAppBar(title: Text("Histórico"), actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.share),
                      onPressed: () async {
                        Uint8List bytes = await snapshotFile.data.readAsBytes();
                        await Share.file(
                            'Compartilhar histórico',
                            'Histórico.pdf',
                            bytes.buffer.asUint8List(),
                            'application/pdf');
                      },
                    )
                  ]),
                  path: snapshotFile.data.path,
                );
              },
            );
          case RequestState.LOADING:
          default:
            return Scaffold(
                appBar: customAppBar(title: Text("Histórico")),
                body: Center(
                  child: CircularProgressIndicator(),
                ));
        }
      },
    );
  }
}
