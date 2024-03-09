import 'package:caracas_ya_app/database/dao/usuario_dao.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  var usuario = {}.obs;

  @override
  void onInit() async {
    final user = await UsuarioDao().get();
    usuario.value = user!.toJson();
    super.onInit();
  }
}
