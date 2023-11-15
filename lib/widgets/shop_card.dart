import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/screens/list_product.dart';
import 'package:shopping_list/screens/login.dart';
import 'package:shopping_list/screens/menu.dart';
import 'package:shopping_list/screens/shoplist_form.dart';

class ShopCard extends StatelessWidget {
  final ShopItem item;
  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
      color: Color.fromARGB(255, 83, 182, 252),
      child: InkWell(
        onTap: () async {
          // Navigate to the appropriate route based on the button name
          if (item.name == "Add Product") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ShopFormPage()),
            );
          } else if (item.name == "View Products") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProductPage()));
          } else if (item.name == "Logout") {
            final response =
                await request.logout("http://127.0.0.1:8000/auth/logout/");
            String message = response["message"];
            if (response['status']) {
              String uname = response["username"];
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message Good bye, $uname."),
              ));
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message"),
              ));
            }
          } else {
            // Show SnackBar for other buttons
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                  content: Text("You pressed the ${item.name} button!")));
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
