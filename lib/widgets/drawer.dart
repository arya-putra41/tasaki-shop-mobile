import 'package:flutter/material.dart';
import 'package:tasaki_shop/screens/menu.dart';
import 'package:tasaki_shop/screens/productform_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Color(0xff60a5fa)),
            child: Column(
              children: [
                Text(
                  "Tasaki Shop",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inconsolata(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Misaka City's Best Football Merchandise",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inconsolata(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.shopping_bag_rounded),
            title: const Text("Main Page"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text("Create Product"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProductFormPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
