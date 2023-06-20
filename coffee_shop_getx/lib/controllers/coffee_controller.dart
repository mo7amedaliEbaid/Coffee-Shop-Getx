import 'package:coffee_shop_get/dummy_data/dummy_data.dart';
import 'package:get/get.dart';

import '../consts/app_constants.dart';
import '../models/drink_model.dart';
import '../view/screens/order_screen.dart';

class CoffeeController extends GetxController {
  RxList<Drink> _coffeeList = <Drink>[].obs;

  RxList<Drink> get getCoffeeList => _coffeeList;

  @override
  void onInit() {
    super.onInit();
    List<Drink> list=coffeelist;
    _coffeeList.addAll(list);
  }

  navigateToOrderScreen(int index) {
    Get.toNamed(Appconstants.orderroute, arguments: _coffeeList[index]);
  }
}
