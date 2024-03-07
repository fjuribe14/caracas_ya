import 'dart:convert';

import 'package:isar/isar.dart';

part 'usuario.g.dart';

@collection
class Usuario {
  Id? id = Isar.autoIncrement;
  String? name;
  @Index(unique: true, replace: true)
  String? username;
  String? email;
  String? avatar;
  bool? active;
  String? descripcion;
  UsuarioTxAtributo? txAtributo;
  DateTime? createdAt;
  String? stVerificado;

  Usuario({
    this.name,
    this.username,
    this.email,
    this.avatar,
    this.active,
    this.descripcion,
    this.txAtributo,
    this.createdAt,
    this.stVerificado,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        name: json["name"],
        username: json["username"],
        email: json["email"],
        avatar: json["avatar"],
        active: json["active"],
        descripcion: json["descripcion"],
        txAtributo: json["tx_atributo"] == null
            ? null
            : UsuarioTxAtributo.fromJson(json["tx_atributo"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        stVerificado: json["st_verificado"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "username": username,
        "email": email,
        "avatar": avatar,
        "active": active,
        "descripcion": descripcion,
        "tx_atributo": txAtributo?.toJson(),
        "created_at": createdAt?.toIso8601String(),
        "st_verificado": stVerificado,
      };
}

@embedded
class UsuarioTxAtributo {
  TxAtributoTxAtributo? txAtributo;
  String? txNombre;
  String? txApellido;
  String? email;
  String? txTelefono;
  DateTime? feNacimiento;
  String? idCliente;
  String? coIdentificacion;
  String? schemeId;

  UsuarioTxAtributo({
    this.txAtributo,
    this.txNombre,
    this.txApellido,
    this.email,
    this.txTelefono,
    this.feNacimiento,
    this.idCliente,
    this.coIdentificacion,
    this.schemeId,
  });

  factory UsuarioTxAtributo.fromJson(Map<String, dynamic> json) =>
      UsuarioTxAtributo(
        txAtributo: json["tx_atributo"] == null
            ? null
            : TxAtributoTxAtributo.fromJson(json["tx_atributo"]),
        txNombre: json["tx_nombre"],
        txApellido: json["tx_apellido"],
        email: json["email"],
        txTelefono: json["tx_telefono"],
        feNacimiento: json["fe_nacimiento"] == null
            ? null
            : DateTime.parse(json["fe_nacimiento"]),
        idCliente: json["id_cliente"],
        coIdentificacion: json["co_identificacion"],
        schemeId: json["scheme_id"],
      );

  Map<String, dynamic> toJson() => {
        "tx_atributo": txAtributo?.toJson(),
        "tx_nombre": txNombre,
        "tx_apellido": txApellido,
        "email": email,
        "tx_telefono": txTelefono,
        "fe_nacimiento":
            "${feNacimiento!.year.toString().padLeft(4, '0')}-${feNacimiento!.month.toString().padLeft(2, '0')}-${feNacimiento!.day.toString().padLeft(2, '0')}",
        "id_cliente": idCliente,
        "co_identificacion": coIdentificacion,
        "scheme_id": schemeId,
      };
}

@embedded
class TxAtributoTxAtributo {
  String? referealCode;

  TxAtributoTxAtributo({
    this.referealCode,
  });

  factory TxAtributoTxAtributo.fromJson(Map<String, dynamic> json) =>
      TxAtributoTxAtributo(
        referealCode: json["refereal_code"],
      );

  Map<String, dynamic> toJson() => {
        "refereal_code": referealCode,
      };
}

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());
