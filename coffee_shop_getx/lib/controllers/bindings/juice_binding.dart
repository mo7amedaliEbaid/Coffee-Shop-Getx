import 'package:coffee_shop_get/controllers/juice_controller.dart';
import 'package:get/instance_manager.dart';



class JuiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => JuiceController());
  }
}
