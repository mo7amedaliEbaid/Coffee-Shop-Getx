import 'package:get/get.dart';

import '../consts/app_constants.dart';
import '../models/drink_model.dart';
import '../view/screens/order_screen.dart';
class JuiceController extends GetxController {
  var _juiceList = <Drink>[].obs;

  List<Drink> get getjuiceList => _juiceList;

  @override
  void onInit() {
    super.onInit();
    var list = [
      Drink(
        id: '6',
        name: 'Orange',
        icon: 'images/juice/orange.jpeg',
        price: 15.25, qty: 0,
      ),
      Drink(
        id: '7',
        name: 'Mango',
        icon: 'images/juice/mango.jpg',
        price: 18.00, qty: 0,
      ),
      Drink(
        id: '8',
        name: 'Apple',
        icon: 'images/juice/apple.jpg',
        price: 22.20, qty: 0,
      ),
      Drink(
        id: '9',
        name: 'Watermelon',
        icon: 'images/juice/waterme.jpg',
        price: 24.66, qty: 0,
      ),
      Drink(
        id: '10',
        name: 'Strawberries',
        icon: 'images/juice/strawb.jpeg',
        price: 30.55, qty: 0,
      ),
      Drink(
        id: '11',
        name: 'Pear',
        icon: 'images/juice/pear.jpg',
        price: 45.55, qty: 0,
      ),
    ];
    _juiceList.addAll(list);
  }

  navigateToOrderScreen(int index) {
    Get.toNamed(Appconstants.orderroute, arguments: _juiceList[index]);
  }
}
