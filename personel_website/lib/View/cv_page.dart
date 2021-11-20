import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class PdfPage extends StatelessWidget {
  PdfPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PdfView(
      controller: PdfController(
        document: PdfDocument.openAsset("assets/CV.pdf"),
      ),
    );
  }
}
