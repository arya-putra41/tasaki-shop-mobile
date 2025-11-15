import 'package:flutter/material.dart';
import 'package:tasaki_shop/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductCard({super.key, required this.product, required this.onTap});

  String _formatCategory(Product product) {
    var categories = {
      'shoes': 'Shoes',
      'jersey': 'Jersey',
      'pants': 'Pants',
      'pad': 'Pad',
      'headwear': 'Headwear',
      'gloves': 'Gloves',
      'ball': 'Ball',
      'bag': 'Bag',
      'bottle': 'Bottle',
      'other': 'Other',
    };
    return categories[product.category]!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: InkWell(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Thumbnail
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    'http://localhost:8000/proxy-image/?url=${Uri.encodeComponent(product.thumbnail)}',
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 150,
                      color: Colors.grey[300],
                      child: const Center(child: Icon(Icons.broken_image)),
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // Name
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),

                // Category | Featured
                Row(
                  children: [
                    Text('In: ${_formatCategory(product)}'),
                    const SizedBox(width: 6),
                    // Featured indicator
                    if (product.isFeatured)
                      Container(
                        padding: EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
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

                const SizedBox(height: 6),

                // Seller and stock
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      "\$${product.price}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.blue[900]
                      ),
                    ),
                  ),

                // Content preview
                Text(
                  product.description.length > 100
                      ? '${product.description.substring(0, 100)}...'
                      : product.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 6),

                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
