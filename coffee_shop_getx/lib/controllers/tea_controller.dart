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
        id: '1',
        name: 'Black',
        icon: 'images/tea/black.jpg',
        price: 9.25,
      ),
      Drink(
        id: '2',
        name: 'Ice',
        icon: 'images/tea/ice.jpg',
        price: 11.00,
      ),
      Drink(
        id: '3',
        name: 'Green',
        icon: 'images/tea/green.jpg',
        price: 8.20,
      ),
      Drink(
        id: '4',
        name: 'Herbal',
        icon: 'images/tea/herbal.jpg',
        price: 14.66,
      ),
      Drink(
        id: '5',
        name: 'White',
        icon: 'images/tea/white.jpg',
        price: 10.55,
      ),

    ];
    _teaList.addAll(list);
  }

  navigateToOrderScreen(int index) {
    Get.toNamed("/order", arguments: _teaList[index]);
  }
}
