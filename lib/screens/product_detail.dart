import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasaki_shop/models/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name,
        style: GoogleFonts.inconsolata(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail image
            if (product.thumbnail.isNotEmpty)
              Image.network(
                'http://localhost:8000/proxy-image/?url=${Uri.encodeComponent(product.thumbnail)}',
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 250,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.broken_image, size: 50),
                  ),
                ),
              ),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category & Featured
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          border: BoxBorder.all(),
                        ),
                        child: Text(
                          "In: ${product.category.toUpperCase()}",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                          ),
                        ),
                      ),
                      SizedBox(width: 6,),
                      if (product.isFeatured)
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.blue[900],
                        ),
                        child: Text(
                          'Featured!',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  // Title
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Seller & Stock
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                          border: Border(right: BorderSide(color: Colors.blue[900]!))
                        ),
                        child: Text("Sold by ${product.username}",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.blue[900],
                        ),),
                      ),
                      SizedBox(width: 4,),
                      Text(
                        "${product.stock} available",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900],
                        ),
                      )
                    ],
                  ),

                  // Price
                  const SizedBox(height: 12,),
                  Text(
                    "\$${product.price}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: Colors.blue[900]
                    ),
                  ),

                  const Divider(height: 20),

                  // Full content
                  Text(
                    product.description,
                    style: const TextStyle(
                      fontSize: 16.0,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}