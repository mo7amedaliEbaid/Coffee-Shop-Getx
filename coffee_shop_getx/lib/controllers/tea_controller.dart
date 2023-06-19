import 'package:coffee_shop_get/consts/app_constants.dart';
import 'package:get/get.dart';

import '../models/drink_model.dart';
import '../view/screens/order_screen.dart';
class TeaController extends GetxController {
  var _teaList = <Drink>[].obs;

  List<Drink> get getteaList => _teaList;

  @override
  void onInit() {
    super.onInit();
    var list = [
      Drink(
        id: 14,
        name: 'Black',
        icon: 'images/tea/black.jpg',
        price: 9.25, qty: 0,
      ),
      Drink(
        id: 15,
        name: 'Ice',
        icon: 'images/tea/ice.jpg',
        price: 11.00, qty: 0,
      ),
      Drink(
        id: 16,
        name: 'Green',
        icon: 'images/tea/green.jpg',
        price: 8.20, qty: 0,
      ),
      Drink(
        id: 17,
        name: 'Herbal',
        icon: 'images/tea/herbal.jpg',
        price: 14.66, qty: 0,
      ),
      Drink(
        id: 18,
        name: 'White',
        icon: 'images/tea/white.jpg',
        price: 10.55, qty: 0,
      ),

    ];
    _teaList.addAll(list);
  }

  navigateToOrderScreen(int index) {
    Get.toNamed(Appconstants.orderroute, arguments: _teaList[index]);
  }
}
