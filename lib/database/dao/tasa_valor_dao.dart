import 'package:isar/isar.dart';

import 'package:caracas_ya_app/database/db.dart';
import 'package:caracas_ya_app/database/models/models.dart';

class TasaValorDao {
  final isar = IsarHelper.instance.isar;

  Future<List<TasaValor>> getAll() async {
    return await isar.tasaValors.where().findAll();
  }
}
