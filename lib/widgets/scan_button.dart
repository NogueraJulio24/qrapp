import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:qrapp/providers/scan_list_provider.dart';
import 'package:qrapp/utils/utils.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3d8bef', 'Cancel', true, ScanMode.DEFAULT);

        DateTime hour = DateTime.now();
        String hourString = DateFormat('dd-MM-yyyy – kk:mm').format(hour);

        if (barcodeScanRes == '-1') {
          return;
        }

        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);

        final scan = await scanListProvider.newScan(barcodeScanRes, hourString);

        launchURL(context, scan);
      },
      child: Icon(Icons.filter_center_focus),
    );
  }
}
