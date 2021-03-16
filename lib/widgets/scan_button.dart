import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3d8bef', 'Cancel', true, ScanMode.QR);

        print(barcodeScanRes);
      },
      child: Icon(Icons.filter_center_focus),
    );
  }
}
