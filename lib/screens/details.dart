import 'package:flutter/material.dart';
import 'package:shopping_app/constants/constants.dart';
import 'package:shopping_app/models/furniture_items.dart';
import 'package:shopping_app/pages/cart_screen.dart';

class Details extends StatefulWidget {
  const Details({
    super.key,
    required this.products,
    required this.index,
    required this.addToCart,
    required this.cartItems,
    required this.removeFromCart,
  });

  final List<FurnitureItem> products;
  final int index;
  final Function(FurnitureItem) addToCart;
  final List<FurnitureItem> cartItems;
  final Function(FurnitureItem) removeFromCart;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back))),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.products[widget.index].images),
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.products[widget.index].title,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text(
                  '\$${widget.products[widget.index].price}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(widget.products[widget.index].description),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    widget.addToCart(widget.products[widget.index]);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Item added to cart!'),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Constants.darkGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 75),
                    child: Text(
                      'Add to cart',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CartScreen(
                              cartItems: widget.cartItems,
                              removeFromCart: widget.removeFromCart)));
                    },
                    icon: const Icon(Icons.shopping_cart))
              ],
            )
          ],
        ),
      ),
    );
  }
}
