import 'package:flutter/material.dart';
import 'package:shopping_app/constants/constants.dart';
import 'package:shopping_app/models/furniture_items.dart';
import 'package:shopping_app/screens/allProducts.dart';
import 'package:shopping_app/screens/bed.dart';
import 'package:shopping_app/screens/chairs.dart';
import 'package:shopping_app/screens/sofa.dart';
import 'package:shopping_app/screens/table.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage(
      {super.key,
      required this.addToCart,
      required this.cartItems,
      required this.removeFromCart});
  final Function(FurnitureItem) addToCart;

  final List<FurnitureItem> cartItems;
  final Function(FurnitureItem) removeFromCart;
  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  late Widget selectedWidget;

  @override
  void initState() {
    super.initState();
    selectedWidget = Allproducts(
      addToCart: widget.addToCart,
      cartItems: widget.cartItems,
      removeFromCart: widget.removeFromCart,
    );
  }

  //Widget selectedWidget =  Allproducts(addToCart: widget.addToCart,);
  String selectedIcon = 'all';
  void updateSelectedIcon(String icon) {
    setState(() {
      selectedIcon = icon;
      switch (icon) {
        case 'all':
          selectedWidget = Allproducts(
            addToCart: widget.addToCart,
            cartItems: widget.cartItems,
            removeFromCart: widget.removeFromCart,
          );
          break;
        case 'chair':
          selectedWidget = Chairs(
              addToCart: widget.addToCart,
              cartItems: widget.cartItems,
              removeFromCart: widget.removeFromCart);
          break;
        case 'table':
          selectedWidget = Tables(
              addToCart: widget.addToCart,
              cartItems: widget.cartItems,
              removeFromCart: widget.removeFromCart);
          break;
        case 'sofa':
          selectedWidget = Sofa(
              addToCart: widget.addToCart,
              cartItems: widget.cartItems,
              removeFromCart: widget.removeFromCart);
          break;
        case 'bed':
          selectedWidget = Bed(
              addToCart: widget.addToCart,
              cartItems: widget.cartItems,
              removeFromCart: widget.removeFromCart);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return (Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 12.0,
          ),
          child: SizedBox(
            width: Constants.deviceWidth(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    updateSelectedIcon('all');
                  },
                  child: Column(
                    children: [
                      selectedIcon == 'all'
                          ? const Icon(Icons.star)
                          : const Icon(Icons.star_border),
                      const Text(
                        "All",
                        style: TextStyle(
                          fontSize: 13,
                          // color: selected ? Colors.red : Colors.blue
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    updateSelectedIcon('chair');
                  },
                  child: Column(
                    children: [
                      selectedIcon == 'chair'
                          ? const Icon(Icons.chair_alt)
                          : const Icon(Icons.chair_alt_rounded),
                      const Text(
                        "Chairs",
                        style: TextStyle(fontSize: 13),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    updateSelectedIcon('table');
                  },
                  child: Column(
                    children: [
                      selectedIcon == 'table'
                          ? const Icon(Icons.table_restaurant)
                          : const Icon(Icons.table_restaurant_outlined),
                      const Text(
                        "Table",
                        style: TextStyle(fontSize: 13),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    updateSelectedIcon('sofa');
                  },
                  child: Column(
                    children: [
                      selectedIcon == 'sofa'
                          ? const Icon(Icons.chair)
                          : const Icon(Icons.chair_outlined),
                      const Text(
                        "Sofa",
                        style: TextStyle(fontSize: 13),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    updateSelectedIcon('bed');
                  },
                  child: Column(
                    children: [
                      selectedIcon == 'bed'
                          ? const Icon(Icons.bed)
                          : const Icon(Icons.bed_outlined),
                      const Text(
                        "Bed",
                        style: TextStyle(fontSize: 13),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: selectedWidget,
        ),
      ],
    ));
  }
}
