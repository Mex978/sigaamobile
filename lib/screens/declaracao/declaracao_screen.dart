import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';

import '../../consts/request_state.dart';
import '../../controllers/user_controller.dart';
import '../../shared/components/custom_app_bar.dart';

class DeclaracaoScreen extends StatefulWidget {
  @override
  _DeclaracaoScreenState createState() => _DeclaracaoScreenState();
}

class _DeclaracaoScreenState extends State<DeclaracaoScreen> {
  final _userController = GetIt.I.get<UserController>();
  @override
  void initState() {
    _userController.recoverDeclaracao();
    super.initState();
  }

  Future<String> createPdf(String pdfBase64) async {
    var bytes = base64Decode(pdfBase64.replaceAll('\n', ''));
    final output = await getApplicationDocumentsDirectory();
    final file = File("${output.path}/declaracao.pdf");
    await file.writeAsBytes(bytes.buffer.asUint8List());

    return "${output.path}/example.pdf";
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        switch (_userController.stateDeclaracao) {
          case RequestState.SUCCESS:
            return FutureBuilder<String>(
              future: createPdf(_userController.declaracao.image),
              builder: (context, snapshotPath) {
                if (!snapshotPath.hasData) {}
                return PDFViewerScaffold(
                  appBar: customAppBar(title: Text("Declaração de vínculo")),
                  path: snapshotPath.data,
                );
              },
            );
          case RequestState.LOADING:
          default:
            return Scaffold(
                // titleSliverBar: widget.anexo.rotulo,
                appBar: customAppBar(title: Text("Declaração de vínculo")),
                body: Center(
                  child: CircularProgressIndicator(),
                ));
        }
      },
    );
  }
}
