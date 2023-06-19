import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

import '../models/order_model.dart';

class CartController extends GetxController {
  Order? myorder = Order();

  Order? getcart() {
    final _box = GetStorage();
    myorder = _box.read('Order');
    print(myorder?.coffee?.name.toString());
  /*  if (myorder==null){
      throw Exception("order isnt added");
    }else{*/
      return myorder;
   // }

  }

  @override
  void onInit() {
    super.onInit();
    getcart();
  }
}
