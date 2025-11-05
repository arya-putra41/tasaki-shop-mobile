import 'package:flutter/material.dart';
import 'package:tasaki_shop/widgets/drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = "";
  String _description = "";
  double _price = 0;
  int _stock = 0;
  String _category = "shoes";
  String _thumbnail = "";
  bool _isFeatured = false;

  final List<String> categories = [
    'shoes',
    'jersey',
    'pants',
    'pad',
    'headwear',
    'gloves',
    'ball',
    'bag',
    'bottle',
    'other',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Create New Product", style: GoogleFonts.inconsolata(fontWeight: FontWeight.bold)),
        ),
        backgroundColor: Color(0xff60a5fa),
        foregroundColor: Colors.white,
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Name
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Name",
                      hintText: "Insert product name...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _name = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Your product must have a name!";
                      }
                      return null;
                    },
                  ),
                ),

                // Product Price
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Price",
                      hintText: "Insert product price...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    initialValue: "0",
                    onChanged: (String? value) {
                      setState(() {
                        _price = double.parse(value!);
                      });
                    },
                    validator: (String? value) {
                      if (value == null ||
                          double.tryParse(value) == null ||
                          double.parse(value) <= 0) {
                        return "Price must be a positive number";
                      }
                      return null;
                    },
                  ),
                ),

                // Product Stock
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Stock",
                      hintText: "Insert product stock...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    initialValue: "0",
                    onChanged: (String? value) {
                      setState(() {
                        _stock = int.parse(value!);
                      });
                    },
                    validator: (String? value) {
                      if (value == null ||
                          int.tryParse(value) == null ||
                          int.parse(value) <= 0) {
                        return "Stock must be a positive integer";
                      }
                      return null;
                    },
                  ),
                ),

                // Product category
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: "Category",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    initialValue: _category,
                    items: categories
                        .map(
                          (cat) => DropdownMenuItem(
                            value: cat,
                            child: Text(
                              cat[0].toUpperCase() + cat.substring(1),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _category = value!;
                      });
                    },
                  ),
                ),

                // Product description
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Description",
                      hintText: "Insert product description...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _description = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Your product must have a description!";
                      }
                      return null;
                    },
                  ),
                ),

                // Product thumbnail URL (optional)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Thumbnail URL (optional)",
                      hintText: "Insert URL for thumbnail image...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _thumbnail = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value != null && Uri.tryParse(value) == null) {
                        return "Invalid thumbnail URL!";
                      }
                      return null;
                    },
                  ),
                ),

                // Feature this product?
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SwitchListTile(
                    title: const Text("Feature this product"),
                    value: _isFeatured,
                    onChanged: (bool value) {
                      setState(() {
                        _isFeatured = value;
                      });
                    },
                  ),
                ),

                // Submit Button
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          Colors.blueAccent,
                        ),
                      ),
                      child: Text(
                        "Save Product",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Product saved!"),
                                content: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Product Name: $_name", style: TextStyle(fontWeight: FontWeight.bold),),
                                      Text("Price: \$$_price"),
                                      Text("Stock: $_stock"),
                                      Text("Category: $_category"),
                                      Text("Description: $_description"),
                                      Text("Thumbnail URL: ${_thumbnail.isEmpty ? "None" : _thumbnail}"),
                                      Text(_isFeatured ? "Product is featured" : "Product is not featured", style: TextStyle(fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text("Continue"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      _formKey.currentState!.reset();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
