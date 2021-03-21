// @dart=2.9
import 'package:flutter/material.dart';
import 'package:qrapp/providers/db_provider.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Maps'),
      ),
      body: Center(
        child: Text(scan.value),
      ),
    );
  }
}
