import 'package:flutter/material.dart';

class imageTiles extends StatelessWidget {
  const imageTiles({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.category,
  });
  final String image;
  final String title;
  final String price;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 180,
              width: 300,
              child: Image(image: NetworkImage(image)),
            ),
            //Image.asset(image),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        "\$$price",
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      const Spacer(),
                      //SvgPicture.string(MyIcons.rightArrow)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
