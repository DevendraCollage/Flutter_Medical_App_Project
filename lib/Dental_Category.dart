import 'package:flutter/material.dart';
import 'Product_Detail_Screen.dart';

class Dental_Category extends StatelessWidget {
  final String categoryName;

  Dental_Category({required this.categoryName});

  // product list
  final List<Map<String, dynamic>> products = [
    {
      'imagePath': 'assets/images/Product1.png',
      'productName': 'Sugar Free Gold',
      'productPrice': 'Rs.100',
      'rating': 4.5,
    },
    {
      'imagePath': 'assets/images/Product2.png',
      'productName': 'Accu-check Active',
      'productPrice': 'Rs.112',
      'rating': 4.2,
    },
    {
      'imagePath': 'assets/images/Product2.png',
      'productName': 'Accu-check Active',
      'productPrice': 'Rs.112',
      'rating': 4.2,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemCount: products.length, // Use the length of the product list
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductItem(
            imagePath: product['imagePath'],
            productName: product['productName'],
            productPrice: product['productPrice'],
            rating: product['rating'],
          );
        },
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String imagePath;
  final String productName;
  final String productPrice;
  final double rating;

  ProductItem({
    required this.imagePath,
    required this.productName,
    required this.productPrice,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the product detail screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              imagePath: imagePath,
              productName: productName,
              productPrice: productPrice,
              rating: rating,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 8,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(imagePath), // Use passed image path
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(productName),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    productPrice,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 16),
                      Text(rating.toString()),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
