import 'package:coffee_shop_get/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../consts/global_constants.dart';
import '../../controllers/coffee_controller.dart';
import '../../models/order_model.dart';
import '../../view/screens/cart_screen.dart';
import '../widgets/animated_searchbar_widget.dart';
import '../widgets/greatday_widget.dart';
import '../widgets/drawer_widget.dart';

class CoffeeScreen extends StatelessWidget {
  final String title = "Coffee";
  late CoffeeController _coffeeController ;
  CartController _cartcontroller = Get.put<CartController>(CartController());
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final box = GetStorage();


  @override
  Widget build(BuildContext context) {
    _coffeeController = Get.find<CoffeeController>();

    // Order? order=(box.read('Order'))??Order();
    //  order = (box.read('Order'));
  //  order = Order();
    return Scaffold(
      backgroundColor: authbackcolor,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: authbackcolor,
        elevation: 0.0,
        bottomOpacity: 0.0,
        leading: IconButton(
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          icon: Icon(
            Icons.sort,
            size: 35.0,
            color: Colors.black,
          ),
        ),
        actions: [
         // AnimatedSearchBar(),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            greatday(context, title, Colors.brown),
            kSizedBox,
            Expanded(
              child: Obx(
                () => ListView.separated(
                  itemBuilder: (ctx, i) => ListTile(
                    onTap: () {
                      _coffeeController.navigateToOrderScreen(i);
                    },
                    title: Text(
                      _coffeeController.getCoffeeList[i].name,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontSize: 24.0,
                            letterSpacing: 2.0,
                          ),
                    ),
                    subtitle: Text(
                      '\$ ${_coffeeController.getCoffeeList[i].price.toString()}',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    leading: CircleAvatar(
                      backgroundColor: Colors.brown,
                      child: Text(
                        '${i + 1}',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ),
                  separatorBuilder: (_, __) => Divider(),
                  itemCount: _coffeeController.getCoffeeList.length,
                ),
              ),
            ),
           /* Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 10,
                color: Colors.pink.shade50,
              ),
            ),*/
          ],
        ),
      ),
      drawerScrimColor: Colors.black54,
      drawer: MainDrawer(),
     /* floatingActionButton: GetBuilder<CartController>(builder: (_){
            return _cartcontroller.myorder==null? Container():FloatingActionButton(
              onPressed: () {
                print(box.read('Order'));
                Get.to(() => CartScreen());
              },
              child: Icon(
                Icons.add_shopping_cart_rounded,
                color: Colors.white,
              ),
              backgroundColor: Colors.pink.shade300,
            );*/
    //  })

    );
  }
}
