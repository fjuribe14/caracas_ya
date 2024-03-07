import 'dart:developer';

import 'package:caracas_ya_app/database/db.dart';
import 'package:caracas_ya_app/database/models/models.dart';
import 'package:isar/isar.dart';

class UsuarioDao {
  final isar = IsarHelper.instance.isar;

  Future<Usuario> create(Usuario usuario) async {
    final result = await isar.usuarios
        .where()
        .usernameEqualTo(usuario.username)
        .findFirst();

    if (result != null) {
      log('El usuario ya existe.');
      return result;
    }

    return await isar.writeTxn(() async {
      await isar.usuarios.put(usuario);
      log('Usuario creado.');
      return usuario;
    });
  }

  Future<Usuario?> get() async {
    return await isar.usuarios.where().findFirst();
  }

  Future<List<Usuario?>> getAll() async {
    return await isar.usuarios.where().findAll();
  }

  Future<void> update(Usuario usuario) async {
    return await isar.writeTxn(() async {
      await isar.usuarios.put(usuario);
    });
  }

  Future<void> delete() async {
    return await isar.writeTxn(() async => await isar.usuarios.clear());
  }
}
