import 'package:coffee_shop_get/controllers/coffee_controller.dart';
import 'package:get/instance_manager.dart';



class CoffeeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CoffeeController());
  }
}
