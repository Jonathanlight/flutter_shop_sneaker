import 'package:app/models/product.dart';
import 'package:app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'dart:math' as math;

class ItemCard extends StatelessWidget {
  final Product product;
  final VoidCallback? press;

  const ItemCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                  decoration: BoxDecoration(
                    color: product.color,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Hero(
                    tag: product.id,
                    child: Transform.rotate(
                      angle: math.pi / 180 * 10, //80,
                      alignment: Alignment.center,
                      child: Image.asset(product.image),
                    ),
                  ),
                ),
                Positioned(
                    top: 5,
                    left: 0,
                    child: Image.asset(
                      product.sponsor,
                      width: 50,
                      height: 30,
                    )),
                Positioned(
                  top: -2,
                  right: 0,
                  child: RatingStars(
                    value: product.rating,
                    maxValueVisibility: false,
                    valueLabelVisibility: false,
                    animationDuration: Duration(milliseconds: 1000),
                    starOffColor: Color.fromARGB(255, 111, 111, 111),
                    starColor: Color.fromARGB(255, 255, 102, 0),
                    starSpacing: 1,
                    starBuilder: (index, color) => Icon(
                      Icons.star,
                      color: color,
                      size: 20,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding / 4),
            child: Text(
              product.title,
              style: const TextStyle(
                color: Color(0xFF000000),
                fontSize: 15.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding / 4),
            child: Text(
              '${product.price} €',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
