import 'package:flutter/material.dart';
import 'package:shopping/config/setting_util.dart';
import 'package:shopping/views/add_categories_page.dart';
import 'package:shopping/views/cart_page.dart';

class Drawerr extends StatelessWidget {
  const Drawerr({
    super.key,
    this.username = "--",
  });
  final String username;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 56, right: 10),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(5),
            )),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5),
                  )),
              width: MediaQuery.of(context).size.width * 0.8,
              height: 150,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const CircleAvatar(
                          backgroundColor: Colors.amber,
                          child: Icon(Icons.person)),
                      Text('User Name :$username')
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text('phone number'),
                ],
              ),
            ),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              iconColor: Colors.black,
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AddCategoryPage(),
                ));
              },
              leading: const Icon(Icons.add_shopping_cart),
              title: const Text('Add product'),
              iconColor: Colors.black,
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ));
              },
              leading: const Icon(Icons.shopping_bag),
              title: const Text('Cart'),
              iconColor: Colors.black,
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting'),
              iconColor: Colors.black,
            ),
            const Divider(),
            ListTile(
              onTap: () {
                SettingsUtil.signOutFlow(context);
              },
              leading: const Icon(Icons.logout),
              title: const Text('Sign out'),
              iconColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
