import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../../controllers/order_controller.dart';
import '../../utils/global_constants.dart';

class OrderScreen extends StatelessWidget {
  //static const routeName = '/orderscreen';
  //OrderController _orderController = Get.put<OrderController>(OrderController());
  late OrderController _orderController ;

  @override
  Widget build(BuildContext context) {
    _orderController = Get.find<OrderController>();

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 340,
              floating: true,
              title: Text(
                _orderController.getCoffee.name,
                style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: Colors.brown,
                  backgroundColor: Colors.white70
                ),
              ),
              centerTitle: true,
              snap: true,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(_orderController.getCoffee.icon,
                    ),fit: BoxFit.fill,)
                ),

              ),
            ),
            SliverFillRemaining(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getHeaderWithQuantity(context),
                    buildTotalAmountWidget(context),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Cup-Size:',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    buildCupSizeWidget(context),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Sugar (in cubes):',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    buildSugarWidget(context),
                    kSizedBox,
                    buildAddToCartButton(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAddToCartButton(BuildContext context) {
    return GetBuilder<OrderController>(builder: (_){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            onPressed: () {
              _orderController.addToCart();
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.add_shopping_cart,
                  color: Colors.white,
                ),
                Text(
                  'Add to Cart',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
            // splashColor: Theme.of(context).accentColor,
            //  color: Theme.of(context).primaryColor,
            //  shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(10),
            //   ),
          ),
        ),
      );
    });

  }

  Widget buildSugarWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Obx(
          () => Expanded(
            child: RadioListTile(
              title: FittedBox(
                  child: Text(
                'One',
                style: Theme.of(context).textTheme.headline6,
              )),
              value: 1,
              onChanged: (val) {
                _orderController.setSelectedSugarCube(val);
              },
              groupValue: _orderController.getSelectedSugarCubes,
            ),
          ),
        ),
        Obx(
          () => Expanded(
            child: RadioListTile(
              title: FittedBox(
                child:
                    Text('Two', style: Theme.of(context).textTheme.headline6),
              ),
              value: 2,
              onChanged: (val) {
                _orderController.setSelectedSugarCube(val);
              },
              groupValue: _orderController.getSelectedSugarCubes,
            ),
          ),
        ),
        Obx(
          () => Expanded(
            child: RadioListTile(
              title: FittedBox(
                  child: Text('Three',
                      style: Theme.of(context).textTheme.headline6)),
              value: 3,
              onChanged: (val) {
                _orderController.setSelectedSugarCube(val);
              },
              groupValue: _orderController.getSelectedSugarCubes,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCupSizeWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Obx(
          () => Expanded(
            child: RadioListTile(
              title: FittedBox(
                  child: Text(
                'Small',
                style: Theme.of(context).textTheme.headline6,
              )),
              value: 1,
              onChanged: (val) {
                _orderController.setSelectedCupSize(val);
              },
              groupValue: _orderController.getSelectedCupSize,
            ),
          ),
        ),
        Obx(
          () => Expanded(
            child: RadioListTile(
              title: FittedBox(
                child: Text('Medium',
                    style: Theme.of(context).textTheme.headline6),
              ),
              value: 2,
              onChanged: (val) {
                _orderController.setSelectedCupSize(val);
              },
              groupValue: _orderController.getSelectedCupSize,
            ),
          ),
        ),
        Obx(
          () => Expanded(
            child: RadioListTile(
              title: FittedBox(
                  child: Text('Large',
                      style: Theme.of(context).textTheme.headline6)),
              value: 3,
              onChanged: (val) {
                _orderController.setSelectedCupSize(val);
              },
              groupValue: _orderController.getSelectedCupSize,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTotalAmountWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Total Amount:',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
            () => Text(
              '\$ ${_orderController.getTotalPrice}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ),
      ],
    );
  }

  Widget getHeaderWithQuantity(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            _orderController.getCoffee.name,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  _orderController.addQuantity();
                },
                child: Chip(
                  label: Icon(
                    Icons.add,
                    size: 18,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.pink.shade400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(() => Text(_orderController.getQuantity.toString())),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  _orderController.lessQuantity();
                },
                child: Chip(
                  label: Text(
                    '- ',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                  ),
                  backgroundColor: Colors.pink.shade400,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
