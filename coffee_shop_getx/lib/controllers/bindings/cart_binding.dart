
import 'package:get/instance_manager.dart';

import '../cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController());
  }
}
