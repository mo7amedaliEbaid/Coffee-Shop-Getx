import 'Coffee.dart';

class Order {
  final String? orderId;
  final Coffee? coffee;
  final int? quantity;
  final String? cupsize;
  final int? sugarcbes;
  final totalPrice;

  Order({
     this.coffee,
     this.orderId,
     this.cupsize,
     this.sugarcbes,
     this.quantity,
    this.totalPrice,
  });
}
