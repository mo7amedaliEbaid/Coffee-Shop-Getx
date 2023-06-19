import 'package:badges/badges.dart';
import 'package:coffee_shop_get/consts/app_constants.dart';
import 'package:coffee_shop_get/models/drink_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import '../../consts/global_constants.dart';
import '../../controllers/order_controller.dart';

class OrderScreen extends StatelessWidget {
  late OrderController _orderController;

  @override
  Widget build(BuildContext context) {
    _orderController = Get.find<OrderController>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(18.0, 0, 18, 60),
        child: Obx(
          () => _orderController.cartlist.isNotEmpty
              ? InkWell(
                  onTap: () => Get.toNamed(Appconstants.cartroute),
                  child: Badge(
                    child: const Icon(
                      Icons.shopping_cart,
                      size: 40,
                      color: Colors.pink,
                    ),
                    badgeStyle: BadgeStyle(
                      badgeColor: Colors.red,
                    ),
                    badgeContent: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        '${_orderController.cartlist.length}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
        ),
      ),
      body: Container(
        child: CustomScrollView(
          slivers: [
            buildSliverappBar(context),
            SliverFillRemaining(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // getHeaderWithQuantity(context),
                    SizedBox(
                      height: size.height * .035,
                    ),
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
                    buildAddToCartButton(context, _orderController.getCoffee),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSliverappBar(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SliverAppBar(
      backgroundColor: homescafold_color,
      expandedHeight: size.height * .4,
      pinned: true,
      snap: true,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
          // centerTitle: true,

          title: Text(
            _orderController.getCoffee.name,
            style: Theme.of(context).textTheme.headline5?.copyWith(
                color: Colors.black, backgroundColor: homescafold_color),
          ),
          background: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(_orderController.getCoffee.icon),
                    fit: BoxFit.cover)),
          )),
    );
  }

  Widget buildAddToCartButton(BuildContext context, Drink drink) {
    return Obx(() {
      Drink? selectedModel = _orderController.cartlist.firstWhereOrNull(
          (Drink selectedItem) => selectedItem.id == drink.id);

      if (selectedModel == null) {
        return Container(
          margin: EdgeInsets.only(top: 10),
          width: MediaQuery.of(context).size.width * .7,
          child: ElevatedButton(
            onPressed: () {
              //  _orderController.addToCart();
              _orderController.addItemToCart(drink);
            },
            child: Text("Add To Cart"),
          ),
        );
      } else {
        return _buildQty(selectedModel, context);
      }
    });
  }

  Widget _buildQty(Drink selectedModel, BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          width: MediaQuery.of(context).size.width * .5,
          child: ElevatedButton.icon(
            icon: Icon(Icons.delete),
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
            ),
            onPressed: () =>
                _orderController.removeSelectedItemFromCart(selectedModel.id),
            label: Text("Remove"),
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () => _orderController
                  .decreaseQtyOfItemInCart(_orderController.getCoffee),
              icon: Icon(Icons.remove),
            ),
            Text(selectedModel.qty.toString()),
            IconButton(
              onPressed: () => _orderController
                  .increaseQtyOfItemInCart(_orderController.getCoffee),
              icon: Icon(Icons.add),
            ),
          ],
        )
      ],
    );
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
}
