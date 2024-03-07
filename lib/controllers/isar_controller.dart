import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:caracas_ya_app/database/models/models.dart';

class IsarController extends GetxController {
  late Isar isar;

  @override
  void onInit() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      isar = await Isar.open(
        [TasaValorSchema],
        directory: dir.path,
      );
    } catch (e) {
      printError(info: e.toString());
    }

    super.onInit();
  }
}
