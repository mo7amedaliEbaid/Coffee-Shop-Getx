import 'package:coffee_shop_get/controllers/tea_controller.dart';
import 'package:get/instance_manager.dart';

class TeaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TeaController());
  }
}
