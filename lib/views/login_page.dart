import 'package:flutter/material.dart';
import 'package:task/views/home_page.dart';
import 'package:task/widgets/custom_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController usernamecontroll = TextEditingController();
  TextEditingController passwordcontroll = TextEditingController();
  bool secure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  SizedBox(
                    height: 150,
                    child: Image.asset("assets/image/OIP.jpeg"),
                  ),
                  TextFormField(
                    controller: usernamecontroll,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username can't be empty";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: "Username",
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  TextFormField(
                    obscureText: secure,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 8) {
                        return 'Password must be at least 8 characters';
                      }
                      return null;
                    },
                    controller: passwordcontroll,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          secure ? Icons.visibility : Icons.visibility_off,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          secure = !secure;
                          setState(() {});
                        },
                      ),
                      labelText: "Password",
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                      ontap: () {
                        if (formkey.currentState!.validate()) {
                          setState(() {});
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const HomePage();
                            },
                          ));
                          passwordcontroll.clear();
                        }
                      },
                      label: 'Login',
                      color: Colors.blue),
                  const SizedBox(height: 20),
                  const Text('forget password ?',
                      style: TextStyle(decoration: TextDecoration.underline)),
                  const SizedBox(height: 40),
                  CustomButton(
                      ontap: () {},
                      color: Colors.grey,
                      label: 'Create Account'),
                ],
              ),
            ),
          )),
    );
  }
}
