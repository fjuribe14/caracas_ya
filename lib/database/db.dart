import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:caracas_ya_app/database/models/models.dart';

class IsarHelper {
  static IsarHelper? isarHelper;

  IsarHelper._internal();

  static IsarHelper get instance => isarHelper ??= IsarHelper._internal();

  static Isar? _isarDb;

  Isar get isar => _isarDb!;

  Future<void> init() async {
    if (_isarDb != null) {
      return;
    }

    final path = (await getApplicationDocumentsDirectory()).path;
    _isarDb = await Isar.open([
      TasaValorSchema,
    ], directory: path);
  }
}
