import 'package:flutter/material.dart';
import 'package:qrapp/models/scan_model.dart';
import 'package:qrapp/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];

  String selectedType = 'http';

  Future<ScanModel> newScan(String value) async {
    final newScan = new ScanModel(value: value);
    final id = await DBProvider.db.newScan(newScan);
    // Asignar id the db al model
    newScan.id = id;

    if (this.selectedType == newScan.type) {
      this.scans.add(newScan);
      notifyListeners();
    }

    return newScan;
  }

  saveScans() async {
    final scans = await DBProvider.db.getAllScans();
    this.scans = [...scans];
    notifyListeners();
  }

  saveScanByType(String type) async {
    final scans = await DBProvider.db.getScansByType(type);
    this.scans = [...scans];
    this.selectedType = type;
    notifyListeners();
  }

  deleteAll() async {
    await DBProvider.db.deleteAllScan();
    this.scans = [];
    notifyListeners();
  }

  deleteById(int id) async {
    await DBProvider.db.deleteScan(id);
  }
}
