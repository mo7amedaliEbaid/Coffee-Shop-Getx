class Drink {
  final String id;
  final String name;
  final String icon;
  late double price;
  late int qty;
  Drink({required this.id, required this.name, required this.icon, required this.price,required this.qty});
  factory Drink.fromMap(Map<String, dynamic> map) => Drink(
    id: map['id'],
    name: map['name'],
    icon: map['icon'],
    price: map['price'],
   qty: map['qty'],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "icon": icon,
    "price": price,
    "qty": qty,
  };
}
