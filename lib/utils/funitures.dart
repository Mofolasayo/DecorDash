import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_app/models/furniture_items.dart';
import 'package:shopping_app/screens/details.dart';

import 'package:shopping_app/utils/image_tiles.dart';

class Furnitures extends StatefulWidget {
  const Furnitures(
      {super.key,
      required this.jsonUrl,
      required this.addToCart,
      required this.cartItems,
      required this.removeFromCart});
  final String jsonUrl;
  final Function(FurnitureItem) addToCart;
  final List<FurnitureItem> cartItems;
  final Function(FurnitureItem) removeFromCart;
  @override
  State<Furnitures> createState() => _FurnituresState();
}

class _FurnituresState extends State<Furnitures> {
  List<FurnitureItem> products = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async {
    final String response = await rootBundle.loadString(widget.jsonUrl);
    final data = await json.decode(response);
    setState(() {
      products = (data['items'] as List)
          .map((i) => FurnitureItem.fromJson(i))
          .toList();
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 12.0,
                    childAspectRatio: 0.65,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Details(
                                products: products,
                                index: index,
                                addToCart: widget.addToCart,
                                cartItems: widget.cartItems,
                                removeFromCart: widget.removeFromCart,
                              )));
                    },
                    child: imageTiles(
                      image: products[index].images,
                      title: products[index].title,
                      price: products[index].price.toString(),
                      category: products[index].category,
                    ),
                  );
                }),
          );
  }
}
