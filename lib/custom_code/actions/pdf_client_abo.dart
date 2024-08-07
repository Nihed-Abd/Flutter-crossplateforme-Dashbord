// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:typed_data';
import 'dart:convert';

Future pdfClientAbo(
  BuildContext context,
  DocumentReference? clientRef,
) async {
  try {
    if (clientRef == null) {
      print('Client reference is null');
      return;
    }

    final clientSnapshot = await clientRef.get();
    if (!clientSnapshot.exists) {
      print('Client does not exist');
      return;
    }

    final clientData = clientSnapshot.data() as Map<String, dynamic>?;
    if (clientData == null) {
      print('Client data is null');
      return;
    }

    final logoUrl =
        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/association-el-wafa-wlz4l5/assets/07dprgp4dpnl/logo.png';
    final logoResponse = await http.get(Uri.parse(logoUrl));
    if (logoResponse.statusCode != 200) {
      print('Failed to load logo');
      return;
    }
    final logoImage = pw.MemoryImage(logoResponse.bodyBytes);

    // Fetch the TTF font file from GitHub
    final fontUrl =
        'https://raw.githubusercontent.com/Gue3bara/Cairo/master/fonts/Cairo/variable/Cairo%5Bslnt%2Cwght%5D.ttf';
    final fontResponse = await http.get(Uri.parse(fontUrl));
    if (fontResponse.statusCode != 200) {
      print('Failed to load font');
      return;
    }
    final fontData = fontResponse.bodyBytes;
    final arabicFont = pw.Font.ttf(fontData.buffer.asByteData());

    final pdf = pw.Document();

    final String year =
        clientData['year']?.toString() ?? ''; // Use year from clientData
    final Timestamp timestamp = clientData['date'];
    final DateTime date =
        timestamp.toDate(); // Convert Firestore Timestamp to DateTime

    pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Directionality(
          textDirection: pw.TextDirection.rtl,
          child: pw.Column(
            children: [
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('ولاية قبلي',
                          style: pw.TextStyle(font: arabicFont, fontSize: 10)),
                      pw.Text('معتمدية دوز الشمالية',
                          style: pw.TextStyle(font: arabicFont, fontSize: 10)),
                      pw.Text('جمعية التنمية الوفاء',
                          style: pw.TextStyle(font: arabicFont, fontSize: 10)),
                    ],
                  ),
                  pw.Image(logoImage, width: 100, height: 100),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Text('Gouvernorat de Kébili',
                          style: pw.TextStyle(fontSize: 10)),
                      pw.Text('Délégation Douz Nord',
                          style: pw.TextStyle(fontSize: 10)),
                      pw.Text('Association de développement ElWafa',
                          style: pw.TextStyle(fontSize: 10)),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(height: 20),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('التاريخ: ${date.toLocal().toString().split(' ')[0]}',
                      style: pw.TextStyle(font: arabicFont, fontSize: 12)),
                  pw.Text('السنة: $year',
                      style: pw.TextStyle(font: arabicFont, fontSize: 12)),
                ],
              ),
              pw.SizedBox(height: 20),
              pw.Table(
                border: pw.TableBorder.all(),
                children: [
                  pw.TableRow(children: [
                    pw.Padding(
                        padding: pw.EdgeInsets.all(8),
                        child: pw.Text(
                            clientData['nomComplete']?.toString() ?? '',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(font: arabicFont))),
                    pw.Padding(
                        padding: pw.EdgeInsets.all(8),
                        child: pw.Text('الاسم الكامل',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(font: arabicFont))),
                  ]),
                  pw.TableRow(children: [
                    pw.Padding(
                        padding: pw.EdgeInsets.all(8),
                        child: pw.Text(clientData['cin']?.toString() ?? '',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(font: arabicFont))),
                    pw.Padding(
                        padding: pw.EdgeInsets.all(8),
                        child: pw.Text('رقم البطاقة',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(font: arabicFont))),
                  ]),
                  pw.TableRow(children: [
                    pw.Padding(
                        padding: pw.EdgeInsets.all(8),
                        child: pw.Text(clientData['adresse']?.toString() ?? '',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(font: arabicFont))),
                    pw.Padding(
                        padding: pw.EdgeInsets.all(8),
                        child: pw.Text('العنوان',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(font: arabicFont))),
                  ]),
                  pw.TableRow(children: [
                    pw.Padding(
                        padding: pw.EdgeInsets.all(8),
                        child: pw.Text(clientData['metier']?.toString() ?? '',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(font: arabicFont))),
                    pw.Padding(
                        padding: pw.EdgeInsets.all(8),
                        child: pw.Text('المهنة',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(font: arabicFont))),
                  ]),
                  pw.TableRow(children: [
                    pw.Padding(
                        padding: pw.EdgeInsets.all(8),
                        child: pw.Text(
                            clientData['montant_abonnement']?.toString() ?? '',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(font: arabicFont))),
                    pw.Padding(
                        padding: pw.EdgeInsets.all(8),
                        child: pw.Text('مبلغ الاشتراك',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(font: arabicFont))),
                  ]),
                ],
              ),
              pw.SizedBox(height: 20),
              pw.Align(
                alignment: pw.Alignment.bottomRight,
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('امضاء المدير التنفيذي',
                        style: pw.TextStyle(font: arabicFont, fontSize: 12)),
                    pw.Text('معز بنعمر',
                        style: pw.TextStyle(font: arabicFont, fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ));

    final Uint8List pdfSaved = await pdf.save();

    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdfSaved);
    print('PDF generated successfully');
  } catch (e) {
    print('Error generating PDF: $e');
  }
}
