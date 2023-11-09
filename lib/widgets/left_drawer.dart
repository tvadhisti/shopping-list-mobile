import 'package:flutter/material.dart';
import 'package:shopping_list/screens/menu.dart';
// DONE TODO: Import the ShopFormPage page here
import 'package:shopping_list/screens/shoplist_form.dart';


class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              children: [
                Text(
                  'Shopping List',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Write all your shopping needs here!",
                    //DONE  TODO: Add a text style with center alignment, font size 15, white color, and regular weight
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Homa Page'),
            // redirect to MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ),
                );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Add Product'),
            // redirect to ShopFormPage
            onTap: () {
              /*
              DONE TODO: Create routing to ShopFormPage here
              */
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ShopFormPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}