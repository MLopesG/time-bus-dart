
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class PDF extends StatefulWidget {

  final horario_id;
  PDF({this.horario_id});

  @override
  _PDFState createState() => _PDFState();
}

class _PDFState extends State<PDF> {
  bool _isLoading = true;
  PDFDocument document;

  void _loadPDF() async{
    print(widget.horario_id);
    document = await PDFDocument.fromURL(widget.horario_id.linkHorario);
    setState(() {
      _isLoading = false;
    });
  }

  _shareAction() => Share.share('Fique ligado nos horários do(a) ${widget.horario_id.tipoHorario} ${widget.horario_id.nomeBairro}, confira ${widget.horario_id.linkHorario}. APP Routebus - Aplicativo para transporte público', subject: 'Routebus - Aplicativo para transporte público');
  
  @override
  void initState() {
    super.initState();
    _loadPDF();
  }
  
  @override

  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:Text(widget.horario_id.nomeBairro),
          backgroundColor: Color(0xFF0e70c1)
        ),
        body: Center(
          child: _isLoading ? Center(
            child: CircularProgressIndicator(),
          ):PDFViewer(document: document,
            showPicker: false,
          )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:_shareAction,
          tooltip: 'Compartilhar',
          child: Icon(Icons.share),
          backgroundColor: Color(0xFF0e70c1),
        ),
    );
  }
}