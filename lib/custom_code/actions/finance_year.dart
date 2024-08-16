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
import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'dart:convert';

Future financeYear(
  BuildContext context,
  List<DepotRecord>? depots,
  List<WithdrawalRecord>? withdrawals,
  String? year,
  List<PortDepotRecord>? depotTitles,
  List<PortWithdrawalRecord>? withdrawaltitles,
) async {
  try {
    if (depots == null && withdrawals == null) {
      print('Both depot and withdrawal lists are null');
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

    final pdf = pw.Document();

    // Fetch and set Arabic font
    final fontUrl =
        'https://raw.githubusercontent.com/Gue3bara/Cairo/master/fonts/Cairo/variable/Cairo%5Bslnt%2Cwght%5D.ttf';
    final fontResponse = await http.get(Uri.parse(fontUrl));
    if (fontResponse.statusCode != 200) {
      print('Failed to load font');
      return;
    }
    final fontData = fontResponse.bodyBytes;
    final arabicFont = pw.Font.ttf(fontData.buffer.asByteData());

    final monthNames = [
      'يناير',
      'فبراير',
      'مارس',
      'أبريل',
      'مايو',
      'يونيو',
      'يوليو',
      'أغسطس',
      'سبتمبر',
      'أكتوبر',
      'نوفمبر',
      'ديسمبر'
    ];
    final monthNamesFR = [
      'Janvier',
      'Février',
      'Mars',
      'Avril',
      'Mai',
      'Juin',
      'Juillet',
      'Août',
      'Septembre',
      'Octobre',
      'Novembre',
      'Décembre'
    ];

    // Helper function to calculate monthly sums
    double calculateMonthlySum(
      List<dynamic>? records,
      String titre,
      String monthNumber,
    ) {
      return records
              ?.where((record) =>
                  (record.titreString == titre) &&
                  (record.mois == monthNumber) &&
                  (DateTime.parse(record.date!).year.toString() == year))
              .fold<double>(0, (prev, record) => prev + record.montant) ??
          0;
    }

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
              pw.Text('الحساب السنوي لسنة $year',
                  style: pw.TextStyle(font: arabicFont, fontSize: 16)),
              pw.Text('Bilan annuel de l\'année $year',
                  style: pw.TextStyle(fontSize: 16)),
              pw.SizedBox(height: 20),
              pw.Text('جدول الإيداعات',
                  style: pw.TextStyle(font: arabicFont, fontSize: 12)),
              pw.Table(
                border: pw.TableBorder.all(),
                children: [
                  pw.TableRow(children: [
                    pw.Padding(
                        padding: pw.EdgeInsets.all(8),
                        child: pw.Text('العنوان',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(font: arabicFont))),
                    ...monthNames
                        .map(
                          (month) => pw.Padding(
                              padding: pw.EdgeInsets.all(8),
                              child: pw.Text(month,
                                  textAlign: pw.TextAlign.center,
                                  style: pw.TextStyle(font: arabicFont))),
                        )
                        .toList(),
                  ]),
                  ...?depotTitles?.map((title) {
                    final monthlySums = List.generate(12, (index) {
                      final monthNumber = (index + 1).toString();
                      final sum =
                          calculateMonthlySum(depots, title.name!, monthNumber);
                      return pw.Text(sum.toString(),
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(font: arabicFont));
                    });

                    return pw.TableRow(children: [
                      pw.Padding(
                          padding: pw.EdgeInsets.all(8),
                          child: pw.Text(title.name ?? '',
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(font: arabicFont))),
                      ...monthlySums,
                    ]);
                  }).toList(),
                  pw.TableRow(children: [
                    pw.Padding(
                        padding: pw.EdgeInsets.all(8),
                        child: pw.Text('المجموع',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(font: arabicFont))),
                    ...List.generate(12, (index) {
                      final monthNumber = (index + 1).toString();
                      final sum =
                          calculateMonthlySum(depots, 'all', monthNumber);
                      return pw.Text(sum.toString(),
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(font: arabicFont));
                    }),
                  ]),
                ],
              ),
              pw.SizedBox(height: 20),
              pw.Text('جدول السحوبات',
                  style: pw.TextStyle(font: arabicFont, fontSize: 12)),
              pw.Table(
                border: pw.TableBorder.all(),
                children: [
                  pw.TableRow(children: [
                    pw.Padding(
                        padding: pw.EdgeInsets.all(8),
                        child: pw.Text('العنوان',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(font: arabicFont))),
                    ...monthNames
                        .map(
                          (month) => pw.Padding(
                              padding: pw.EdgeInsets.all(8),
                              child: pw.Text(month,
                                  textAlign: pw.TextAlign.center,
                                  style: pw.TextStyle(font: arabicFont))),
                        )
                        .toList(),
                  ]),
                  ...?withdrawaltitles?.map((title) {
                    final monthlySums = List.generate(12, (index) {
                      final monthNumber = (index + 1).toString();
                      final sum = calculateMonthlySum(
                          withdrawals, title.name!, monthNumber);
                      return pw.Text(sum.toString(),
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(font: arabicFont));
                    });

                    return pw.TableRow(children: [
                      pw.Padding(
                          padding: pw.EdgeInsets.all(8),
                          child: pw.Text(title.name ?? '',
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(font: arabicFont))),
                      ...monthlySums,
                    ]);
                  }).toList(),
                  pw.TableRow(children: [
                    pw.Padding(
                        padding: pw.EdgeInsets.all(8),
                        child: pw.Text('المجموع',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(font: arabicFont))),
                    ...List.generate(12, (index) {
                      final monthNumber = (index + 1).toString();
                      final sum =
                          calculateMonthlySum(withdrawals, 'all', monthNumber);
                      return pw.Text(sum.toString(),
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(font: arabicFont));
                    }),
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
                        style: pw.TextStyle(font: arabicFont, fontSize: 10)),
                    pw.Text('معز بنعمر',
                        style: pw.TextStyle(font: arabicFont, fontSize: 12)),
                    pw.SizedBox(height: 10),
                    pw.Text('امين المال',
                        style: pw.TextStyle(font: arabicFont, fontSize: 10)),
                    pw.Text('الفاضل بنبلقاسم',
                        style: pw.TextStyle(font: arabicFont, fontSize: 12)),
                    pw.SizedBox(height: 10),
                    pw.Text('رئيس الجمعية',
                        style: pw.TextStyle(font: arabicFont, fontSize: 10)),
                    pw.Text('نبيل بنعبد النور',
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
