import 'package:app/models/product.dart';
import 'package:app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Color textDark = product.textDark == true ? Colors.black : Colors.white;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  height: 550,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 248, 249, 249),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding),
                      child: Text(
                        product.title,
                        style: TextStyle(
                          fontSize: 30,
                          color: textDark,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding),
                      child: Text(
                        product.description,
                        style: TextStyle(
                          fontSize: 18,
                          color: textDark,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding + 35),
                          child: Hero(
                            tag: product.id,
                            child: Transform.rotate(
                              angle: math.pi / 180 * 45,
                              alignment: Alignment.center,
                              child: Image.asset(product.image),
                            ),
                          ),
                        )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            RatingStars(
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
                            Image.asset(
                              product.sponsor,
                              width: 50,
                              height: 30,
                            ),
                          ],
                        ),
                        Text(
                          '${product.price}€',
                          style: const TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 40.0,
                          ),
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: defaultPadding,
                        vertical: defaultPadding + 30,
                      ),
                      child: Text(
                          'le mythique colorway Twisté, ce dernier se décompose ici entre une base immacule, une languette, un swoosh central et des empiècements noirs sur l avant-pied et rouges à l arrière ainsi que sur la toebox. Les brandings classiques de la Air Jordan déclinés en blanc, complètent l ensemble.'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(24)),
                                    border: Border.all(
                                      color: Color.fromARGB(255, 185, 185, 185),
                                      width: 2,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.exposure_minus_1,
                                    size: 25,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('01'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(24)),
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 2,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 45.0),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24)),
                              border: Border.all(
                                color: Colors.red,
                                width: 2,
                              ),
                            ),
                            child: Icon(
                              Icons.favorite,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              border: Border.all(
                                color: product.color,
                                width: 3,
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.add_shopping_cart,
                                size: 25,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: null,
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(product.color),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 60,
                                right: 60,
                                top: 20,
                                bottom: 20,
                              ),
                              child: Text(
                                'Buy Now',
                                style: TextStyle(
                                  color: textDark,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
