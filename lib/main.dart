// ignore_for_file: avoid_unnecessary_containers, camel_case_types, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

void main() {
  runApp(const MaterialApp(
    home: Reader(),
  ));
}

class Reader extends StatefulWidget {
  const Reader({Key? key}) : super(key: key);

  @override
  _ReaderState createState() => _ReaderState();
}

class _ReaderState extends State<Reader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("pdf reader"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
              child: const Text("Click  me to read pdf"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const mainPage()));
              }),
        ),
      ),
    );
  }
}

class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  // ignore: unused_field
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("pdf viewer"),
        centerTitle: true,
      ),
      body: Container(
          child: SfPdfViewer.asset(
        'assets/19226579694.pdf',
        key: _pdfViewerKey,
      )),
    );
  }
}
