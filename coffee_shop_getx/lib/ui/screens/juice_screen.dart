import 'package:coffee_shop_get/controllers/juice_controller.dart';
import 'package:coffee_shop_get/ui/widgets/greatday_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/global_constants.dart';
import '../widgets/main_drawer.dart';

class JuiceScreen extends StatelessWidget {
  static const routeNamed = '/juice';
  final String title = "Juice";
  JuiceController _juiceController = Get.put<JuiceController>(JuiceController());
//  CartController _cartcontroller = Get.put<CartController>(CartController());
  final _scaffoldKey = GlobalKey<ScaffoldState>();
 // final box = GetStorage();


  @override
  Widget build(BuildContext context) {
   // Order? order=(box.read('Order'))??Order();
    //  order = (box.read('Order'));
    //  order = Order();
    return Scaffold(
        backgroundColor: Colors.orangeAccent.shade100,
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent.shade100,
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
          //  AnimatedSearchBar(),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              greatday(context, title, Colors.orange),
              kSizedBox,
              Expanded(
                child: Obx(
                      () => ListView.separated(
                    itemBuilder: (ctx, i) => ListTile(
                      onTap: () {
                        _juiceController.navigateToOrderScreen(i);
                      },
                      title: Text(
                        _juiceController.getjuiceList[i].name,
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontSize: 24.0,
                          letterSpacing: 2.0,
                        ),
                      ),
                      subtitle: Text(
                        '\$ ${_juiceController.getjuiceList[i].price.toString()}',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Colors.orange,
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
                    itemCount: _juiceController.getjuiceList.length,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 10,
                  color: Colors.pink.shade50,
                ),
              ),
            ],
          ),
        ),
        drawerScrimColor: Colors.black54,
        drawer: MainDrawer(),
        /*floatingActionButton: GetBuilder<CartController>(builder: (_){
          return Container();*///_cartcontroller.myorder==null? Container():FloatingActionButton(
         //   onPressed: () {
          //    print(box.read('Order'));
          //    Get.to(() => CartScreen());
          //  },
           // child: Icon(
            //  Icons.add_shopping_cart_rounded,
             // color: Colors.white,
           // ),
          //  backgroundColor: Colors.pink.shade300,
       //   );
    //    })

    );
  }
}
