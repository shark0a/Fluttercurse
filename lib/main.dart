import 'package:flutter/material.dart';
import 'package:task/views/secondpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? email;
  String? passward;
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController passwardcontroll = TextEditingController();
  TextEditingController usercontroll = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: SizedBox(
                      height: 100,
                      child: Image.asset("assets/image/OIP.jpeg"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50, bottom: 25),
                    child: TextFormField(
                      controller: usercontroll,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Valid is required';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'username',
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: passwardcontroll,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Valid is required';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'password',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SeconedPage()),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        fixedSize: const Size(double.maxFinite, 30),
                      ),
                      child: const Text(
                        'lOGN',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const Text(
                    'Forgot Password? No yawa. Tap me',
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        fixedSize: const Size(double.maxFinite, 30),
                      ),
                      child: const Text(
                        'No Account ? Sign Up',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
