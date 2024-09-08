// import 'package:flutter/material.dart';
//
// class ProductDetailScreen extends StatelessWidget {
//   final String imagePath;
//   final String productName;
//   final String productPrice;
//   final double rating;
//
//   ProductDetailScreen({
//     required this.imagePath,
//     required this.productName,
//     required this.productPrice,
//     required this.rating,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(productName),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Image.asset(imagePath, height: 200), // Display the product image
//             ),
//             SizedBox(height: 20),
//             Text(
//               productName,
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Text(
//               productPrice,
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),
//             Row(
//               children: [
//                 Icon(Icons.star, color: Colors.yellow, size: 24),
//                 SizedBox(width: 5),
//                 Text(
//                   rating.toString(),
//                   style: TextStyle(fontSize: 18),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Product Details',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Here you can add detailed information about the product.',
//               style: TextStyle(fontSize: 16),
//             ),
//             // Add more details as needed
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final String imagePath;
  final String productName;
  final String productPrice;
  final double rating;

  ProductDetailScreen({
    required this.imagePath,
    required this.productName,
    required this.productPrice,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          productName,
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.red),
            onPressed: () {
              // Handle favorite button press
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      imagePath,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                productName,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10),
              Text(
                productPrice,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[700],
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow[700], size: 28),
                  SizedBox(width: 5),
                  Text(
                    rating.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '(${rating * 50} reviews)',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                'Product Details',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'This product is known for its high quality and effectiveness. '
                'It is made from the finest ingredients and is suitable for a wide range of consumers. '
                'Here you can add more detailed information about the product.',
                style:
                    TextStyle(fontSize: 16, height: 1.5, color: Colors.black54),
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Handle "Add to Cart" action
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  icon: Icon(Icons.add_shopping_cart),
                  label: Text("Add to Cart"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
