import 'package:flutter/material.dart';
import 'package:shopping_app/models/furniture_items.dart';
import 'package:shopping_app/utils/funitures.dart';

class Tables extends StatelessWidget {
  const Tables(
      {super.key,
      required this.addToCart,
      required this.cartItems,
      required this.removeFromCart});
  final Function(FurnitureItem) addToCart;
  final List<FurnitureItem> cartItems;
  final Function(FurnitureItem) removeFromCart;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Furnitures(
        addToCart: addToCart,
        removeFromCart: removeFromCart,
        cartItems: cartItems,
        jsonUrl: 'assets/furniture_tables.json',
      ),
    );
  }
}
