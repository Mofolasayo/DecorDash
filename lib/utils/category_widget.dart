import 'package:flutter/material.dart';
import 'package:shopping_app/models/furniture_items.dart';
import 'package:shopping_app/utils/image_tiles.dart';

class CategoryWidget extends StatelessWidget {
  final String category;
  final Map<String, List<FurnitureItem>> groupedProducts;

  const CategoryWidget(
      {super.key, required this.category, required this.groupedProducts});

  @override
  Widget build(BuildContext context) {
    List<FurnitureItem> items = groupedProducts[category] ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(category,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        GridView.builder(
          shrinkWrap:
              true, // Important to prevent GridView from taking infinite height
          physics:
              const NeverScrollableScrollPhysics(), // Disable GridView scrolling
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 12.0,
              childAspectRatio: 0.65,
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                /*Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Details(
                          products: items,
                          index: index,
                        )));*/
              },
              child: imageTiles(
                image: items[index].images,
                title: items[index].title,
                price: items[index].price.toString(),
                category: items[index].category,
              ),
            );
          },
        ),
      ],
    );
  }
}
