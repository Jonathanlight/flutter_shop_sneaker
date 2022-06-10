import 'package:app/models/product.dart';
import 'package:app/screens/details/components/body.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Product product;

  const DetailPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color,
      appBar: AppBar(
        backgroundColor: product.color,
        elevation: 0,
        title: Center(
            child: Text(product.title,
                style: TextStyle(
                  color: product.textDark == true ? Colors.black : Colors.white,
                ))),
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
      body: Body(product: product),
    );
  }
}
