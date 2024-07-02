import 'package:flutter/material.dart';
import 'package:shopping_app/models/furniture_items.dart';
import 'package:shopping_app/utils/funitures.dart';

class Bed extends StatelessWidget {
  const Bed(
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
        jsonUrl: 'assets/furniture_beds.json',
        addToCart: addToCart,
        removeFromCart: removeFromCart,
        cartItems: cartItems,
      ),
    );
  }
}
