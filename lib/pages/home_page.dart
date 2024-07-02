import 'package:flutter/material.dart';
import 'package:shopping_app/constants/constants.dart';
import 'package:shopping_app/models/furniture_items.dart';
import 'package:shopping_app/pages/cart_screen.dart';
import 'package:shopping_app/pages/products_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final List<FurnitureItem> cartItems = [];

  void addToCart(FurnitureItem item) {
    setState(() {
      cartItems.add(item);
    });
  }

  void removeFromCart(FurnitureItem item) {
    setState(() {
      cartItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = [
      /*Allproducts(
        addToCart: addToCart,
        cartItems: cartItems,
        removeFromCart: removeFromCart,
      ),*/
      ProductsPage(
        addToCart: addToCart,
        cartItems: cartItems,
        removeFromCart: removeFromCart,
      ),
      CartScreen(cartItems: cartItems, removeFromCart: removeFromCart),
    ];
    onTappedBar(int index) {
      setState(() {
        currentIndex = index;
      });
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: const Text(
            "DecorDash",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
      body: items[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Constants.darkGrey,
        unselectedItemColor: Colors.grey,
        onTap: onTappedBar,
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: '')
        ],
      ),
    );
  }
}
