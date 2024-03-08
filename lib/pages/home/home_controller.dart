import 'package:get/get.dart';
import 'package:caracas_ya_app/controllers/controller.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    Get.put(MessagingController());
    super.onInit();
  }
}
