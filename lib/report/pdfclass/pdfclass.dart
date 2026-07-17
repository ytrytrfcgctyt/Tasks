import 'dart:io';
import 'package:arabic_reshaper/arabic_reshaper.dart';
import 'package:taskes/report/pdfclass/pdfenum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pasteboard/pasteboard.dart'; // تأكد من استيرادها إذا حليت المشكلة السابقة
import 'package:url_launcher/url_launcher.dart';

class PdfTableData {
  final String tableName;
  final List<String> headers;
  final List<List<String>> rows;

  PdfTableData({
    required this.tableName,
    required this.headers,
    required this.rows,
  });
}

class PdfService {
  static final ArabicReshaper _reshaper = ArabicReshaper();
  static Future<void> processPdf({
    required BuildContext context,
    required String title,
    required String footerText,
    List<PdfTableData>? tables, // تم التعديل هنا ليكون اختيارياً (Nullani)
    required PdfAction action,
    List<pw.Widget>? children,
    List<pw.Widget>? titlechildren,
  }) async {
    final pdf = pw.Document();
    final fontData = await rootBundle.load("assets/fonts/Cairo-Black.ttf");
    final arabicFont = pw.Font.ttf(fontData);

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4.copyWith(
          marginTop: 1.0 * PdfPageFormat.cm,
          marginBottom: 1.0 * PdfPageFormat.cm,
          marginLeft: 1.0 * PdfPageFormat.cm,
          marginRight: 1.0 * PdfPageFormat.cm,
        ),
        theme: pw.ThemeData.withFont(base: arabicFont, bold: arabicFont),
        textDirection: pw.TextDirection.rtl,
        build: (pw.Context context) {
          return [
            pw.Header(
              level: 0,
              child: pw.Column(
                children: [if (titlechildren != null) ...titlechildren],
              ),
            ),
            // pw.SizedBox(height: 5),

            // --- تعديل شرط الجداول هنا ---
            if (tables != null && tables.isNotEmpty)
              ...tables.map((tableData) {
                return pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      tableData.tableName,
                      style: pw.TextStyle(fontSize: 12),
                    ),
                    // pw.SizedBox(height: 10),
                    pw.TableHelper.fromTextArray(
                      headers: tableData.headers,
                      data: tableData.rows,
                      border: pw.TableBorder.all(
                        color: PdfColors.grey300,
                        width: 0.5,
                      ),
                      headerStyle: pw.TextStyle(
                        fontSize: 11,
                        font: arabicFont,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColors.white,
                      ),
                      headerDecoration: const pw.BoxDecoration(
                        color: PdfColors.black,
                      ),
                      cellStyle: pw.TextStyle(
                        fontSize: 10,
                        font: arabicFont,
                        color: PdfColors.black,
                      ),
                      cellAlignment: pw.Alignment.centerRight,
                      rowDecoration: const pw.BoxDecoration(
                        border: pw.Border(
                          bottom: pw.BorderSide(
                            color: PdfColors.grey300,
                            width: 0.5,
                          ),
                        ),
                      ),
                      oddRowDecoration: const pw.BoxDecoration(
                        color: PdfColors.grey100,
                      ),
                      columnWidths: {
                        0: const pw.FlexColumnWidth(0.30),
                        1: const pw.FlexColumnWidth(0.60),
                        2: const pw.FlexColumnWidth(0.10),
                      },
                      tableDirection: pw.TextDirection.rtl,
                    ),
                    // pw.SizedBox(height: 20),
                  ],
                );
              }),

            // --- نهاية تعديل الجداول ---
            // pw.Divider(),
            if (children != null) ...children,

            // pw.SizedBox(height: 10),
            pw.Text(footerText, style: pw.TextStyle(font: arabicFont)),
          ];
        },
      ),
    );

    final pdfBytes = await pdf.save();

    switch (action) {
      case PdfAction.print:
        await Printing.layoutPdf(onLayout: (format) async => pdfBytes);
        break;

      case PdfAction.share:
        try {
          final directory = await getTemporaryDirectory();
          final String fileName = "${title.replaceAll(' ', '_')}.pdf";
          final filePath = '${directory.path}/$fileName';
          final file = File(filePath);
          await file.writeAsBytes(pdfBytes);

          if (Platform.isWindows) {
            if (await file.exists()) {
              await Pasteboard.writeFiles([filePath]);

              final Uri whatsappUri = Uri.parse("whatsapp://send");
              if (await canLaunchUrl(whatsappUri)) {
                await launchUrl(whatsappUri);
              } else {
                await launchUrl(Uri.parse("https://web.whatsapp.com/"));
              }

              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("تم نسخ الملف! افتح المحادثة واضغط Ctrl + V"),
                    backgroundColor: Colors.green,
                  ),
                );
              }
            }
          } else {
            // 1. استخراج أبعاد الشاشة والموقع الحالي من الـ context
            final RenderBox? box = context.findRenderObject() as RenderBox?;
            final Rect? sharePositionOrigin = box != null
                ? box.localToGlobal(Offset.zero) & box.size
                : null;

            // 2. تمرير الإحداثيات لدالة الشير لحل مشكلة iOS
            await Share.shareXFiles(
              [XFile(filePath, mimeType: 'application/pdf')],
              text: title,
              sharePositionOrigin:
                  sharePositionOrigin, // 👈 السطر الذي يحل المشكلة في iOS
            );
          }
        } catch (e) {
          debugPrint("Error: $e");
        }
        break;
      case PdfAction.preview:
        if (context.mounted) {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  PdfPreviewScreen(pdfBytes: pdfBytes, title: title),
            ),
          );
        }
        break;
    }
  }
}

class PdfPreviewScreen extends StatelessWidget {
  final Uint8List pdfBytes;
  final String title;

  const PdfPreviewScreen({
    super.key,
    required this.pdfBytes,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: PdfPreview(
        build: (format) => pdfBytes,
        allowPrinting: true,
        allowSharing: true,
        canChangePageFormat: false,
        initialPageFormat: PdfPageFormat.a4,
      ),
    );
  }
}
