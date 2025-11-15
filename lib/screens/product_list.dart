import 'package:flutter/material.dart';
import 'package:tasaki_shop/models/product.dart';
import 'package:tasaki_shop/widgets/drawer.dart';
import 'package:tasaki_shop/screens/product_detail.dart';
import 'package:tasaki_shop/widgets/product_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductListPage extends StatefulWidget {
  final bool showMyProducts;

  const ProductListPage({super.key, this.showMyProducts = false});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  Future<List<Product>> fetchProducts(CookieRequest request) async {
    final response = await request.get('http://localhost:8000/json/');

    // Decode response to json format
    var data = response;

    // Convert json data to Product objects
    List<Product> list = [];
    for (var d in data) {
      if (d != null) {
        list.add(Product.fromJson(d));
      }
    }
    return list;
  }

  Future<List<Product>> fetchProductsOfUser(CookieRequest request) async {
    // Get username
    String? user = request.getJsonData()["username"];

    if (user == null) {
      return fetchProducts(request);
    }

    final response = await request.get('http://localhost:8000/json/');

    // Decode response to json format
    var data = response;

    // Convert json data to Product objects
    List<Product> list = [];
    for (var d in data) {
      if (d != null) {
        Product readProduct = Product.fromJson(d);
        if (readProduct.username == user) {
          list.add(readProduct);
        }
      }
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          widget.showMyProducts ? 'My Products' : 'Available Products',
          style: GoogleFonts.inconsolata(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder(
        future: widget.showMyProducts ? fetchProductsOfUser(request) : fetchProducts(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData || snapshot.data!.length == 0) {
              return const Column(
                children: [
                  Center(
                    child: Text(
                      'No products have been posted yet',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => ProductCard(
                  product: snapshot.data![index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailPage(product: snapshot.data![index]),
                      ),
                    );
                  },
                ),
              );
            }
          }
        },
      ),
    );
  }
}
