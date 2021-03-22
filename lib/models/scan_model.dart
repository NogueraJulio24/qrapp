import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));

String scanModelToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {
  int? id;
  String? type;
  String value;
  String date;

  ScanModel({
    this.id,
    this.type,
    required this.value,
    required this.date,
  }) {
    if (this.value.contains('http')) {
      this.type = 'http';
    } else {
      this.type = 'geo';
    }
  }

  LatLng getLatLng() {
    final latLng = this.value.substring(4).split(',');
    final lat = double.parse(latLng[0]);
    final lng = double.parse(latLng[1]);

    return LatLng(lat, lng);
  }

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        type: json["type"],
        value: json["value"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "value": value,
        "date": date,
      };
}
