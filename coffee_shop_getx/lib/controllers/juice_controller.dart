import 'package:get/get.dart';

import '../models/Coffee.dart';
import '../ui/screens/order_screen.dart';
class JuiceController extends GetxController {
  var _juiceList = <Drink>[].obs;

  List<Drink> get getjuiceList => _juiceList;

  @override
  void onInit() {
    super.onInit();
    var list = [
      Drink(
        id: '1',
        name: 'Orange',
        icon: 'images/juice/orange.jpeg',
        price: 15.25,
      ),
      Drink(
        id: '2',
        name: 'Mango',
        icon: 'images/juice/mango.jpg',
        price: 18.00,
      ),
      Drink(
        id: '3',
        name: 'Apple',
        icon: 'images/juice/apple.jpg',
        price: 22.20,
      ),
      Drink(
        id: '4',
        name: 'Watermelon',
        icon: 'images/juice/waterme.jpg',
        price: 24.66,
      ),
      Drink(
        id: '5',
        name: 'Strawberries',
        icon: 'images/juice/strawb.jpeg',
        price: 30.55,
      ),
      Drink(
        id: '5',
        name: 'Pear',
        icon: 'images/juice/pear.jpg',
        price: 45.55,
      ),
    ];
    _juiceList.addAll(list);
  }

  navigateToOrderScreen(int index) {
    Get.toNamed(OrderScreen.routeName, arguments: _juiceList[index]);
  }
}
