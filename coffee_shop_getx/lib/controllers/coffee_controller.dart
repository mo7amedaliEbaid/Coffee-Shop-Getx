import 'package:get/get.dart';

import '../models/Coffee.dart';
import '../ui/screens/order_screen.dart';
class CoffeeController extends GetxController {
  var _coffeeList = <Coffee>[].obs;

  List<Coffee> get getCoffeeList => _coffeeList;

  @override
  void onInit() {
    super.onInit();
    var list = [
      Coffee(
        id: '1',
        name: 'Espresso',
        icon: 'images/coffee/esep.jpg',
        price: 15.25,
      ),
      Coffee(
        id: '2',
        name: 'Cappuccino',
        icon: 'images/coffee/capu.jpeg',
        price: 18.00,
      ),
      Coffee(
        id: '3',
        name: 'Macchiato',
        icon: 'images/coffee/machito.jpg',
        price: 22.20,
      ),
      Coffee(
        id: '4',
        name: 'Mocha',
        icon: 'images/coffee/mocha.jpg',
        price: 24.66,
      ),
      Coffee(
        id: '5',
        name: 'Latte',
        icon: 'images/coffee/latte.jpg',
        price: 30.55,
      ),
      Coffee(
        id: '5',
        name: 'Americano',
        icon: 'images/coffee/americano.jpg',
        price: 45.55,
      ),
      Coffee(
        id: '5',
        name: 'Doppio',
        icon: 'images/coffee/doppio.jpg',
        price: 25.99,
      ),
    ];
    _coffeeList.addAll(list);
  }

  navigateToOrderScreen(int index) {
    Get.toNamed(OrderScreen.routeName, arguments: _coffeeList[index]);
  }
}
