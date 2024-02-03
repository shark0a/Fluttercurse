import 'package:flutter/material.dart';
import 'package:task/views/login_page.dart';

class Drawerr extends StatelessWidget {
  const Drawerr({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 56, right: 10),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(5),
            )),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
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
                        icon: Icon(Icons.close),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.amber,
                          child: Icon(Icons.person)),
                      Text('User Name')
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('phone number'),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              iconColor: Colors.black,
            ),
            ListTile(
              leading: Icon(Icons.add_shopping_cart),
              title: Text('Add product'),
              iconColor: Colors.black,
            ),
            ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text('Cart'),
              iconColor: Colors.black,
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting'),
              iconColor: Colors.black,
            ),
            Divider(),
            ListTile(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              leading: Icon(Icons.logout),
              title: Text('Sign out'),
              iconColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
