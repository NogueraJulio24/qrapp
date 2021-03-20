// @dart=2.9
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qrapp/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common/sqlite_api.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  // Iniciarlizar DB, en caso que ya exista no lo crea.
  Future<Database> initDB() async {
    // get paht de db
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db');

    // Create db
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            type TEXT,
            value TEXT
          )
        ''');
    });
  }

  Future<int> newScan(ScanModel newScan) async {
    final db = await database;
    final res = await db.insert('Scans', newScan.toJson());
    //retorna el ID
    return res;
  }

  Future<ScanModel> getScanById(int i) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [i]);
    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>> getAllScans() async {
    final db = await database;
    final res = await db.query('Scans');

    return res.isNotEmpty ? res.map((s) => ScanModel.fromJson(s)).toList() : [];
  }

  Future<List<ScanModel>> getScansByType(String type) async {
    final db = await database;
    final res = await db.rawQuery('''
      SELECT * FROM Scans WHERE type = '$type'
    ''');

    return res.isNotEmpty ? res.map((s) => ScanModel.fromJson(s)).toList() : [];
  }

  Future<int> updateScan(ScanModel newScan) async {
    final db = await database;
    final res = await db.update(
      'Scans',
      newScan.toJson(),
      where: 'id = ?',
      whereArgs: [newScan.id],
    );

    return res;
  }

// Delete the data by id
  Future<int> deleteScan(int id) async {
    final db = await database;
    final res = await db.delete(
      'Scans',
      where: 'id = ?',
      whereArgs: [newScan.id],
    );

    return res;
  }

  // Delete all the data
  Future<int> deleteAllScan() async {
    final db = await database;
    final res = await db.delete(
      'Scans',
    );

    return res;
  }
}
