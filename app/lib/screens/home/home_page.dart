import 'package:app/models/product.dart';
import 'package:app/screens/details/detail_page.dart';
import 'package:app/screens/home/components/item_card.dart';
import 'package:app/utils/constants.dart';
import 'package:app/screens/home/components/categories.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            'assets/images/logo.png',
            width: 130,
          ),
        ),
        leading: const Padding(
          padding: EdgeInsets.all(8),
          child: Icon(Icons.shopping_bag),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8),
            child: Icon(Icons.add_shopping_cart),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Icon(Icons.share),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Text(
              'Sneaker Shop',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Image.asset('assets/images/pub.jpeg'),
          ),
          const Categories(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  mainAxisSpacing: defaultPadding,
                  crossAxisSpacing: defaultPadding,
                ),
                itemBuilder: (context, index) => ItemCard(
                  product: products[index],
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailPage(product: products[index]),
                    ),
                  ),
                ),
                itemCount: products.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
