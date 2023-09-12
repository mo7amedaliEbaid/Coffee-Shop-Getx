import 'package:coffee_shop_get/dummy_data/dummy_data.dart';
import 'package:get/get.dart';

import '../consts/app_constants.dart';
import '../models/drink_model.dart';
import '../view/screens/order_screen.dart';

class JuiceController extends GetxController {
  RxList<Drink> _juiceList = <Drink>[].obs;

  RxList<Drink> get getjuiceList => _juiceList;

  @override
  void onInit() {
    super.onInit();
    List<Drink> list = juicelist;
    _juiceList.addAll(list);
  }

  navigateToOrderScreen(int index) {
    Get.toNamed(Appconstants.orderroute, arguments: _juiceList[index]);
  }
}
