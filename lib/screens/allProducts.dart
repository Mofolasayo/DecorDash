import 'package:flutter/material.dart';
import 'package:shopping_app/models/furniture_items.dart';
import 'package:shopping_app/utils/funitures.dart';

class Allproducts extends StatelessWidget {
  const Allproducts(
      {super.key,
      required this.addToCart,
      required this.cartItems,
      required this.removeFromCart});
  final Function(FurnitureItem) addToCart;
  final List<FurnitureItem> cartItems;
  final Function(FurnitureItem) removeFromCart;
  @override
  Widget build(BuildContext context) {
    return Furnitures(
      jsonUrl: 'assets/furniture_items.json',
      addToCart: addToCart,
      cartItems: cartItems,
      removeFromCart: removeFromCart,
    );
  }
}
