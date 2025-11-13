import 'package:flutter/material.dart';

void main () {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: const Text('Product Cards'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ProductCard(product: Product.dart),
                ProductCard(product: Product.flutter),
                ProductCard(product: Product.firebase),
              ],
            )
          )
        )
      )
    )
  );
}

enum Product {
  dart(
    title: 'Dart',
    description: 'The best object language',
    icon: 'lib/Week5/assets/ex3/dart.png'
  ),
  flutter(
    title: 'Flutter',
    description: 'The best mobile widget library',
    icon: 'lib/Week5/assets/ex3/flutter.png'
  ),
  firebase(
    title: 'Firebase',
    description: 'The best cloud database',
    icon: 'lib/Week5/assets/ex3/firebase.png'
  );

  final String title;
  final String description;
  final String icon;

  const Product({
    required this.title,
    required this.description,
    required this.icon
  });
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              product.icon,
              width: 50,
              height: 50,
            ),

            SizedBox(height: 10),

            Text(
              product.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),

            SizedBox(height: 5),

            Text(
              product.description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600]
              ),
            ),
          ],
        )
      )
    );
  }
}