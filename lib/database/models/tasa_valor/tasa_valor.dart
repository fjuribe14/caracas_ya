import 'dart:convert';

import 'package:isar/isar.dart';

part 'tasa_valor.g.dart';

@collection
class TasaValor {
  Id? idTasa;
  String? moMonto;
  String? coTasa;
  DateTime? tsFechaTimestampIns;
  DateTime? fechaValor;

  TasaValor({
    this.idTasa,
    this.moMonto,
    this.coTasa,
    this.tsFechaTimestampIns,
    this.fechaValor,
  });

  factory TasaValor.fromJson(Map<String, dynamic> json) => TasaValor(
        idTasa: json["id_tasa"],
        moMonto: json["mo_monto"],
        coTasa: json["co_tasa"],
        tsFechaTimestampIns: json["ts_fecha_timestamp_ins"] == null
            ? null
            : DateTime.parse(json["ts_fecha_timestamp_ins"]),
        fechaValor: json["fecha_valor"] == null
            ? null
            : DateTime.parse(json["fecha_valor"]),
      );

  Map<String, dynamic> toJson() => {
        "id_tasa": idTasa,
        "mo_monto": moMonto,
        "co_tasa": coTasa,
        "ts_fecha_timestamp_ins": tsFechaTimestampIns?.toIso8601String(),
        "fecha_valor":
            "${fechaValor!.year.toString().padLeft(4, '0')}-${fechaValor!.month.toString().padLeft(2, '0')}-${fechaValor!.day.toString().padLeft(2, '0')}",
      };
}

TasaValor tasaValorFromJson(String str) => TasaValor.fromJson(json.decode(str));

String tasaValorToJson(TasaValor data) => json.encode(data.toJson());
