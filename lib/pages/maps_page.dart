import 'package:flutter/material.dart';
import 'package:qrapp/widgets/scan_tiles.dart';

class MapsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScanTiles(type: 'geo');
  }
}
